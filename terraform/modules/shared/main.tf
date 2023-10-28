terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.3.0"
    }
  }
}

locals {
  region   = "us-central1"
  zone     = "us-central1-c"
  location = "us-central"
  project  = "davidshen84"
}

resource "google_project" "davidshen84" {
  name            = "davidshen84"
  project_id      = "davidshen84"
  billing_account = "012E22-43EC6A-79BC27"

  labels = {
    firebase = "enabled"
  }
}

resource "google_project_iam_policy" "davidshen84" {
  project     = google_project.davidshen84.project_id
  policy_data = data.google_iam_policy.project-iam.policy_data
}

resource "google_app_engine_application" "davidshen84" {
  project     = google_project.davidshen84.project_id
  location_id = local.location

  iap {
    enabled              = true
    oauth2_client_id     = var.oath2-client-id
    oauth2_client_secret = var.oath2-client-secret
  }
}

resource "google_storage_bucket" "app-engine-buckets" {
  for_each                 = toset(["davidshen84.appspot.com", "staging.davidshen84.appspot.com", "us.artifacts.davidshen84.appspot.com"])
  name                     = each.key
  location                 = local.region
  force_destroy            = true
  public_access_prevention = "enforced"

  uniform_bucket_level_access = false

  versioning {
    enabled = false
  }
}

resource "google_kms_key_ring" "default" {
  name     = "default"
  location = local.region
}

resource "google_kms_crypto_key" "tfstate-key" {
  name     = "tfstate-key"
  key_ring = google_kms_key_ring.default.id

  lifecycle {
    prevent_destroy = true
  }
}

data "google_storage_project_service_account" "gcs-account" {}

resource "google_kms_crypto_key_iam_binding" "tfstate-key-binding" {
  crypto_key_id = google_kms_crypto_key.tfstate-key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  members = ["serviceAccount:${data.google_storage_project_service_account.gcs-account.email_address}"]
}

resource "random_id" "bucket-prefix" {
  byte_length = 7
}

resource "google_storage_bucket" "secured-bucket" {
  name                     = "${random_id.bucket-prefix.hex}-tfstate"
  force_destroy            = false
  location                 = local.region
  storage_class            = "STANDARD"
  public_access_prevention = "enforced"

  versioning {
    enabled = true
  }

  encryption {
    default_kms_key_name = google_kms_crypto_key.tfstate-key.id
  }

  depends_on = [
    google_kms_crypto_key_iam_binding.tfstate-key-binding
  ]
}

resource "google_artifact_registry_repository" "default" {
  provider      = google-beta
  repository_id = "default"
  location      = local.region
  format        = "DOCKER"

  cleanup_policies {
    id     = "default-old-images"
    action = "DELETE"

    condition {
      older_than = "1314000s"
    }
  }

  cleanup_policies {
    id     = "keep-recent-2-versions"
    action = "KEEP"

    most_recent_versions {
      keep_count = 2
    }
  }
}

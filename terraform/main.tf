terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.3.0"
    }
  }
}


module "shared" {
  source = "./modules/shared"

  oath2-client-id     = var.oath2-client-id
  oath2-client-secret = var.oath2-client-secret
}

provider "google" {
  project = "davidshen84"
  region  = module.shared.region
  zone    = module.shared.zone
}

provider "google-beta" {
  project = "davidshen84"
  region  = module.shared.region
  zone    = module.shared.zone
}

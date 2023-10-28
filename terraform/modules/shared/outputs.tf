output "tfstate-bucket-name" {
  value = google_storage_bucket.secured-bucket.name
}

output "location" {
  value = local.location
}

output "region" {
  value = local.region
}

output "zone" {
  value = local.zone
}

terraform {
  backend "gcs" {
    bucket = "ae19d27b36b8b0-tfstate"
    prefix = "terraform/state/shared"
  }
}

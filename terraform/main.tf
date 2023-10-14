terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.1.0"
    }
  }
}

module "shared" {
  source = "./modules/shared"

  oath2-client-id     = var.oath2-client-id
  oath2-client-secret = var.oath2-client-secret
}

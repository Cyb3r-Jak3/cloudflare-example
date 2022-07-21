terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.20.1"
    }
  }
}

provider "aws" {
  access_key = var.cloudflare_access_key
  secret_key = var.cloudflare_secret_key
  skip_credentials_validation = true
  skip_region_validation = true
  skip_requesting_account_id = true
  endpoints {
    s3 = "https://${var.cloudflare_account_id}.r2.cloudflarestorage.com"
  }
}


# resource "aws_s3_bucket" "cloudflare-bucket" {
#   bucket = "my-tf-test-bucket"
# }
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4"
    }
  }
}

provider "aws" {
  access_key = var.cloudflare_access_key
  secret_key = var.cloudflare_secret_key
  skip_credentials_validation = true
  skip_region_validation = true
  skip_requesting_account_id = true
  region                      = "auto"
  endpoints {
    s3 = "https://${var.cloudflare_account_id}.r2.cloudflarestorage.com"
  }
}


resource "aws_s3_bucket" "cloudflare-bucket" {
  bucket = "my-tf-test-bucket"
}

resource "aws_s3_bucket_cors_configuration" "public_bucket_cors" {
  bucket   = aws_s3_bucket.cloudflare-bucket.id

  cors_rule {
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "life_cycles" {
  bucket = aws_s3_bucket.cloudflare-bucket.id
  rule {
    id = "expire-bucket"
    status = "Enabled"
    expiration {
      days = 1
    }
  }
  rule {
    id = "abort-multipart-upload"
    status = "Enabled"
    abort_incomplete_multipart_upload {
      days_after_initiation = 1
    }
  }
}
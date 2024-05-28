terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.39.0"
    }
  }
}

# Parameters
variable "p_aws_region" {
  description = "AWS region where the S3 bucket will be created"
  type        = string
  default     = "us-east-1"
}

variable "p_environment" {
  type        = string
  description = "Environment name for the bucket"
  default     = "non-prod"
}

# Region
provider "aws" {
  region = var.p_aws_region
}

# Resource
resource "aws_s3_bucket" "r_bucket" {
  bucket = "jb-s3-terraform-${var.p_environment}-eus1"
  acl    = "private"
  versioning {
    enabled = true
  }
  tags = {
    Environment = var.p_environment
  }
}

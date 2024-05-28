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
  description = "AWS region for the Amazon Connect instance"
  type        = string
  default     = "us-east-1"
}

variable "p_aws_service" {
  description = "Service name for the Amazon Alias name"
  type        = string
  default     = "amazon-connect"
}

variable "p_environment" {
  type        = string
  description = "Environment name for the amazon-connect"
  default     = "non-prod"
}

  # Region
provider "aws" {
  region = var.p_aws_region
}

# Resource
resource "aws_connect_instance" "r_amazon_connect_instance" {
  instance_alias            = "jb-${var.p_aws_service}-terraform-${var.p_environment}-eus1"
  inbound_calls_enabled     = true
  outbound_calls_enabled    = true
  identity_management_type  = "CONNECT_MANAGED"
}

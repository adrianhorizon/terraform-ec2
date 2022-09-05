terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.20.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }
  }
  required_version = ">= 1.1.9"

  cloud {
    organization = "baldo"

    workspaces {
      name = "test-prod"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  default_tags {
    tags = {
      Environment = "prod"
      ManagedBy   = "terraform"
      Creator     = "adrianhorizon"
    }
  }
}

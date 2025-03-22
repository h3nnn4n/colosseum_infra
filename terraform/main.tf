terraform {
  required_version = "= 1.6.5"

  # https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.27.2"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # https://www.terraform.io/language/settings/backends/s3
  backend "s3" {
    bucket = "colosseum-terraform-state"
    key    = "infra"
    region = "us-east-1"
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key

  default_tags {
    tags = {
      application = "colosseum"
    }
  }
}

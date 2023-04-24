provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      Env     = terraform.workspace
      Project = "sandbox-s3-pmtiles-maplibregl"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "kamataryo-tfstate-tokyo"
    region         = "ap-northeast-1"
    key            = "sandbox-s3-pmtiles-maplibregl.tfstate"
    encrypt        = true
}

  required_version = ">= 1.4.5"

  required_providers {
    aws = {
      "source"  = "hashicorp/aws"
      "version" = "~> 4.64"
    }
  }
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

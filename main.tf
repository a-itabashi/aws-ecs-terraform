terraform {
  backend "s3" {
    bucket         = "aws-ecs-terraform-tfstate-sample-itabashi"
    key            = "terraform.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "aws-ecs-terraform-tfstate-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.79.0"
    }
  }
}

provider "aws" {
  region = local.region
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = local.app
}

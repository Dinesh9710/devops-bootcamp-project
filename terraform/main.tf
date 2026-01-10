terraform {
  backend "s3" {
    bucket         = "devops-bootcamp-terraform-dineshvar" 
    key            = "state/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
    use_lockfile   = true 
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_ecr_repository" "project_repo" {
  name                 = "devops-bootcamp/final-project-dineshvar"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "ecr_repository_url" {
  value = aws_ecr_repository.project_repo.repository_url
}
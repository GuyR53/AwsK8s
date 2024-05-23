terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.23.1"
    }
  }
  backend "s3" {
    bucket         	   = "terraform-tfstate-test-dev-test"
    key              	   = "state/terraform.tfstate"
    region         	   = "us-west-2"
    encrypt        	   = true
    dynamodb_table = "tfstate"
  }

}

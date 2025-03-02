# author: acikgozb
# description: A template to register the AWS TF provider for a single region.
# goal: To have a basic AWS provider registration, and have a documentation regarding which values are used for identity configuration (for local and remote).

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    # For local invocations:
    # profile = -backend-config

    # Required for both local and remote invocations:
    # region = -backend-config 
    # bucket = -backend-config 
    # key = -backend-config 
  }
}

provider "aws" {
  # For local invocations:
  # profile = $AWS_PROFILE

  # For remote invocations:
  # TF can use $AWS_SECRET_ACCESS_KEY and $AWS_ACCESS_KEY_ID implicitly.

  # Required for both local and remote invocations:
  # region = $AWS_REGION
}


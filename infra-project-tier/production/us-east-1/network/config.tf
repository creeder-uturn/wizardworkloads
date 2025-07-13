locals {
  # Static state and project details
  environment = "production"
  region      = "us-east-1"
  state_path  = "network" # Path to the current folder within region, no trailing /

  default_tags = {
    ManagedBy   = "OpenTofu"
    Environment = local.environment
  }
}

# Everything below is templated, and unchanging between projects
terraform {
  required_version = "~> 1.10" # OpenTofu

  # In the example below, I'd replace `wizardworkloads` with a company name and repository name
  # backend "s3" {
  #   bucket         = "wizardworkloads-${local.environment}-tfstate-${local.region}"
  #   region         = local.region
  #   key            = "${local.state_path}/opentofu.tfstate"
  #   dynamodb_table = "wizardworkloads-${local.environment}-tflock-${local.region}"
  # }
}

provider "aws" {
  region = local.region

  default_tags {
    tags = local.default_tags
  }
}

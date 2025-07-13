data "aws_region" "current" {}

data "aws_vpc" "environment" {
  tags = {
    Environment = var.environment
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.environment.id]
  }

  tags = {
    Tier = "Public"
  }
}

data "aws_iam_role" "website_service_task_role" {
  name = "WebsiteServiceTaskRole"
}

data "aws_iam_role" "website_service_task_exec_role" {
  name = "WebsiteServiceTaskExecRole"
}

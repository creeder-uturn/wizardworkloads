data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  # Number of bits to use for subnetting.
  bits = ceil(log(var.number_of_azs * 2, 2))

  private_subnets_cidrs = [
    for i in range(var.number_of_azs) : cidrsubnet(var.cidr, local.bits, i)
  ]

  public_subnets_cidrs = [
    for i in range(var.number_of_azs) : cidrsubnet(var.cidr, local.bits, var.number_of_azs + i)
  ]
}

# This could be a reference to a module repository, or an open source module in this case
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 6.0"

  name = var.environment
  cidr = var.cidr

  # Calculate which AZs to use based on the number of AZs specified
  azs = slice(data.aws_availability_zones.available.names, 0, var.number_of_azs)

  private_subnets = local.private_subnets_cidrs
  public_subnets  = local.public_subnets_cidrs

  enable_nat_gateway = true

  tags = merge(var.tags, {
    Environment = var.environment
  })
}

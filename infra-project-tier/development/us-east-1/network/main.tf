module "network" {
  # TODO: Update the source to point to the repo on a tag
  # This would usually be a reference to a different repository, but for simplicity
  # we're referencing the same repository. Do not do this for real!
  source = "../../../../infra-stack-tier/network"

  environment = local.environment
  cidr        = "10.10.0.0/16"
}

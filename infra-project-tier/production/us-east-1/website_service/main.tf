module "website_service" {
  # TODO: Update the source to point to the repo on a tag
  # This would usually be a reference to a different repository, but for simplicity
  # we're referencing the same repository. Do not do this for real!
  source = "../../../../infra-stack-tier/website_service"

  environment = local.environment
}

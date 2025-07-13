module "website_service" {
  # This would usually be a reference to a different repository, but for simplicity
  # we're referencing the same repository. Do not do this for real!
  source = "git@github.com:creeder-uturn/wizardworkloads.git//infra-stack-tier/website_service?ref=v1.0.0"

  environment = local.environment
}

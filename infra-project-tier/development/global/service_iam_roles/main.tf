module "service_iam_roles" {
  # This would usually be a reference to a different repository, but for simplicity
  # we're referencing the same repository. Do not do this for real!
  source = "git@github.com:creeder-uturn/wizardworkloads.git//infra-stack-tier/service_iam_roles?ref=v1.0.0"

  # No additional configuration needed!
}

module "website_service_task_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 5.0"

  create_role = true

  trusted_role_services = ["ecs-tasks.amazonaws.com"]
  role_name             = "WebsiteServiceTaskRole"
  role_requires_mfa     = false

  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
  ]
}

module "website_service_task_exec_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 5.0"

  create_role = true

  trusted_role_services = ["ecs-tasks.amazonaws.com"]
  role_name             = "WebsiteServiceTaskExecRole"
  role_requires_mfa     = false

  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",
  ]
}

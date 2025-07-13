# Service IAM Roles Stack

Contains any IAM roles that need to be spun up for services.

Should be applied in the global region, instead of a specific region, due to containing IAM resources which do not exist in a specific region (and will conflict if applied twice in the same AWS account).


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_website_service_task_exec_role"></a> [website\_service\_task\_exec\_role](#module\_website\_service\_task\_exec\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | ~> 5.0 |
| <a name="module_website_service_task_role"></a> [website\_service\_task\_role](#module\_website\_service\_task\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | ~> 5.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->

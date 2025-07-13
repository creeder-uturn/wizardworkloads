# The Wizard’s Guide to Well-Architected IaC Workloads

This repository accompanies the presentation by Craig Reeder.

## Additional Reading
- [Links & Additional Reading](Links.md)
- [Additional Tools](./Additional%20Tools.md)

## Structure

This repository is organized as if it were multiple repositories, combined here for simplicity and ease of sharing.

- **infra-project-tier**

  Represents the project tier of the Three-Tier architecture described in the presentation. Ideally, this would reference a separate stack repository with a version tag, but for this example, it self-references this repository using its release tag.

- **infra-stack-tier**

  Represents the stack tier of the Three-Tier architecture.

Depending on your needs, you may also maintain an `infra-modules-tier` repository and custom OpenTofu/Terraform modules for your modules tier. In this example, I use the publicly available "Terraform AWS Modules" to keep things simple.

## Remote State

For simplicity, remote state is not used in this example. In real projects, you should always use remote state to manage your OpenTofu/Terraform state files securely and collaboratively. I recommend keeping the remote state configuration in the `config.tf` file of each project. A placeholder is included to illustrate this configuration.

If you are using OpenTofu, you can leverage the new feature to specify the backend using locals. I use this extensively to reduce per-project configuration changes to just four lines.

## Note on .gitignore

The `.gitignore` files in the project tier and stack tier are slightly different. In the project tier, `.terraform.lock.hcl` should not be ignored, as it provides important information about which provider versions are known to work with the project.

However, at the stack and module tiers, the lock file is only used when running an init for validation or development purposes. In these cases, I recommend clearing them regularly and not including them in the repository. This means each time you run `tf init`, you will get the newest valid provider - which is desirable, as it helps you learn if a new provider version breaks anything for you.

You can upgrade your provider versions by using `tf init -upgrade`.

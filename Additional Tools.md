# Additional Tools

This section lists tools I recommend for working with OpenTofu/Terraform, AWS, Kubernetes, and related workflows. These tools help streamline development, enforce best practices, and reduce manual errors.

---

### tenv
https://github.com/tofuutils/tenv

A version manager for OpenTofu, Terraform, Terragrunt, Terramate, and Atmos.

I never install Terraform or OpenTofu directly; I always use tenv for version management. I recommend including a `.opentofu-version` or `.terraform-version` file in each project to enforce correct tool usage and version.

When using tenv, use the `tf` command instead of calling `tofu` or `terraform` directly to benefit from automatic tool switching.

---

### awsp
https://github.com/abyss/go-awsp

AWSP is an AWS profile switcher that I maintain, enabling a secure and organized workflow.

My [default AWS CLI profile](https://docs.aws.amazon.com/cli/v1/userguide/cli-configure-files.html) contains no credentials. I maintain separate profiles for each client. Using `awsp`, I switch to the appropriate profile at the start of each session, helping prevent mistakes in the wrong account or environment.

I also display the current AWS profile in my shell prompt for visibility.

[aws-vault](https://github.com/99designs/aws-vault) is a similar tool, focusing more on secure credential storage.

---

### kubeswitch
https://github.com/danielfoehrKn/kubeswitch

Kubeswitch helps manage multiple Kubernetes contexts.

I use it similarly to `awsp`: my default `kubectl` context has no authentication or cluster. I point kubeswitch at a folder of configuration files and use it to switch contexts as needed.

---

### Taskfile.dev
https://taskfile.dev/

Task is a modern command runner, serving as a simpler alternative to Makefiles.

I've included a Taskfile in this repository with a few helper jobs. While Makefiles can serve the same purpose, Task offers a more modern and user-friendly syntax.

---

### tflint
https://github.com/terraform-linters/tflint

A linter for Terraform code.

Lint your Terraform just like you lint your source code. The default rules are not very strict, so I recommend enabling additional rules. You can find my `.tflint.hcl` configuration here: https://github.com/abyss/dotfiles/blob/main/.tflint.hcl

---

### terraform-docs
https://terraform-docs.io/

Automatically generates documentation for OpenTofu/Terraform modules.

This tool is widely used for auto-generating documentation for public Terraform/OpenTofu modules.

Remember to supplement auto-generated docs with your own important notes!

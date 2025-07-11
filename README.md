# The Wizard’s Guide to Well-Architected IaC Workloads

This is the companion repository to the presentation given by Craig Reeder.

## Structure
Imagine this repository is multiple repositories (I've included everything here to make it concise and easy to share or follow).

- infra-project-tier
This represents the project tier of the Three-Tier architecture laid out in the presentation. Ideally, this would reference a separate stack repository with a version tag, but I have instead made it self-reference this repository on it's release tag.

- infra-stack-tier
This represents the stack tier of the Three-Tier architecture laid out in presentation.

Depending on your needs, you may additionally maintain an infra-modules-tier repository and TF modules for your modules tier. In this case, I have deferred to using the publicly available "Terraform AWS Modules" as this keeps simplicity low for an example.

## Remote State
I have chosen not to use remote state for the example to keep it simple, however you should use remote state in your projects when doing them for real. Generally, I recommend keeping the remote state configuration in `config.tf` of the project. I've included a placeholder for where I'd put it.

If you are using OpenTofu, keep in mind you can use the new feature to specify backend using locals - I make heavy usage of this reduce my modifications per project configuration down to 4 lines.

## Additional Tools
Here's a list of additional tools I like to use when operating on TF on a daily basis.

<!-- TODO: Fill out tools
- tenv
- awsp
-->

<!-- TODO: Goals
- Contains example code of some stacks and projects
- Uses the Terraform AWS Modules open-source modules
- Contains a lot of the boilerplate repository cruft I usually include
- Contains a write-up of additional CLI tools I like to use in my developer environment
- Contains a PDF of this presentation
- Squash all commits once done -->

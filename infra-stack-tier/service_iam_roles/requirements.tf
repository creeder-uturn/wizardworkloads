terraform {
  required_version = "~> 1.0"

  # No required provider because this stack does not create any resources itself.
  # This means the required provider is inherited from the module call.
}

variable "environment" {
  description = "The environment for the infrastructure"
  type        = string
}

variable "cidr" {
  description = "CIDR block for the environment"
  type        = string
}

variable "number_of_azs" {
  type        = number
  default     = 2
  description = "Number of availability zones to use"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to resources created in AWS"
}

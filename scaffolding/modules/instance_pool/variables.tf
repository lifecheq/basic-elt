variable "instance_pool_name" {
  description = "Name of the instance pool."
  type        = string
}

variable "custom_tags" {
  description = "Custom tags to apply to instances from the instance pool."
  type        = map(string)
  default     = {}
}

variable "availability" {
  description = "Availability type used for all instances. Allowed values: 'ON_DEMAND' or 'SPOT'"
  type        = string

  validation {
    condition     = contains(["ON_DEMAND", "SPOT"], var.availability)
    error_message = "Availability must be 'ON_DEMAND' or 'SPOT'."
  }
}

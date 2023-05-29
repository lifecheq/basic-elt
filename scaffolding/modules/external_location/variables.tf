variable "external_location_name" {
  description = "Name of external location"
  type        = string
}

variable "storage_credential_id" {
  description = "The ID of the Databricks storage credential for authentication"
  type        = string
}

variable "s3_prefix" {
  description = "Prefix in S3 bucket for the external location"
  type        = string
}

variable "databricks_principal" {
  description = "Name of Databricks principal to grant privileges"
  type        = string
}

variable "privileges" {
  description = "List of privileges to grant"
  type        = list(string)
  default     = ["READ_FILES"]
}

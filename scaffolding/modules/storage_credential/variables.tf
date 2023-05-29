variable "storage_credential_name" {
  description = "Name of storage credential"
  type        = string
}

variable "aws_iam_role_name" {
  description = "Name of AWS IAM role granting S3 bucket access"
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

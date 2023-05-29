variable "group_name" {
  description = "Databricks group name to assign permissions on resources"
  type        = string
}

variable "external_s3_bucket_name" {
  description = "Name of external S3 bucket containing data of interest"
  type        = string
}

variable "aws_instance_profile_arn" {
  description = "AWS instance profile ARN for access to external data"
  type        = string
}

variable "aws_instance_profile_role_arn" {
  description = "AWS IAM role ARN for access to external data"
  type        = string
}

variable "unity_catalog_s3_access_role_arn" {
  description = "AWS IAM role ARN for Unity Catalog to access an S3 bucket"
  type        = string
}

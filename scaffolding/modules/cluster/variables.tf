variable "group_name" {
  description = "Databricks group name to assign permissions on the cluster"
  type        = string
}

variable "cluster_name" {
  description = "Name of the cluster."
  type        = string
}

variable "instance_pool_id" {
  description = "The ID of the instance pool for cluster driver and worker nodes."
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

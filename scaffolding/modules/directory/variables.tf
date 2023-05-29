variable "path" {
  description = "Directory path to grant permissions on"
  type        = string
}

variable "databricks_principal" {
  description = "Databricks principal to grant permissions"
  type        = string
}

variable "permission_level" {
  description = "Permission level to grant on the directory"

}

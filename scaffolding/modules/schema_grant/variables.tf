variable "catalog_name" {
  description = "Name of Databricks Unity Catalog catalog on which to grant privileges"
  type        = string
}

variable "schema_name" {
  description = "Name of Databricks Unity Catalog schema on which to grant privileges"
  type        = string
}

variable "databricks_principal" {
  description = "Name of Databricks principal to grant privileges"
  type        = string
}

variable "privileges" {
  description = "List of privileges to grant"
  type        = list(string)
  default     = ["USE_SCHEMA"]
}


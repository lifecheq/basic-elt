terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
  }
}

resource "databricks_directory" "this" {
  path = var.path
}

resource "databricks_permissions" "folder_usage" {
  directory_path = databricks_directory.this.path
  depends_on     = [databricks_directory.this]

  access_control {
    group_name       = var.databricks_principal
    permission_level = var.permission_level
  }
}

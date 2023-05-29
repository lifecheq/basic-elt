terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
  }
}

resource "databricks_grants" "schema_grant" {
  schema = format("%s.%s", var.catalog_name, var.schema_name)
  grant {
    principal  = var.databricks_principal
    privileges = var.privileges
  }
}

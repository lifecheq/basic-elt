terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
  }
}

resource "databricks_external_location" "external" {
  name            = var.external_location_name
  url             = var.s3_prefix
  credential_name = var.storage_credential_id
}

resource "databricks_grants" "external_loc_creds" {
  external_location = databricks_external_location.external.id
  grant {
    principal  = var.databricks_principal
    privileges = var.privileges
  }
}

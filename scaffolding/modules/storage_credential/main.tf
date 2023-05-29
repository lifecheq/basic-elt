terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
  }
}

resource "databricks_storage_credential" "external" {
  name = var.storage_credential_name
  aws_iam_role {
    role_arn = var.aws_iam_role_name
  }
}

resource "databricks_grants" "external_creds" {
  storage_credential = databricks_storage_credential.external.id
  grant {
    principal  = var.databricks_principal
    privileges = var.privileges
  }
}

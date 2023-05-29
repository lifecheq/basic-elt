output "storage_credential_id" {
  description = "The ID of the Databricks storage credential."
  value       = databricks_storage_credential.external.id
}

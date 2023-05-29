output "instance_pool_id" {
  description = "The ID of the created instance pool."
  value       = databricks_instance_pool.pool.id
}

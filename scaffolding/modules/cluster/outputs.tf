output "cluster_id" {
  description = "The ID of shared compute cluster that was created."
  value       = databricks_cluster.shared.id
}


output "instance_profile_id" {
  description = "The ID of the Databricks instance profile assigned to the cluster"
  value       = databricks_instance_profile.shared.id
}

output "sandbox_cluster_policy_id" {
  description = "The ID of the cluster policy granting restricted compute creation"
  value       = databricks_cluster_policy.sandbox.id
}

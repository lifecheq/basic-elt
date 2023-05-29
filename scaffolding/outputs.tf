output "on_demand_instance_pool_id" {
  description = "The ID of the on-demand instance pool"
  value       = module.on_demand_instance_pool.instance_pool_id
}

output "cluster_id" {
  description = "The ID of the on-demand cluster"
  value       = module.cluster.cluster_id
}

output "databricks_instance_profile_id" {
  description = "The ID of the instance profile for access to external data"
  value       = module.cluster.instance_profile_id
}

output "sandbox_cluster_policy_id" {
  description = "The ID of the cluster policy for sandbox users"
  value       = module.sandbox_cluster_policy.sandbox_cluster_policy_id
}

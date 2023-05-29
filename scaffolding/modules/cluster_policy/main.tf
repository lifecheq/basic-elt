terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
  }
}

resource "databricks_cluster_policy" "sandbox" {
  name                  = "sandbox_compute_policy"
  max_clusters_per_user = 1
  definition = jsonencode({
    "dbus_per_hour" : {
      "type" : "range",
      "maxValue" : 3
    },
  })
}

resource "databricks_permissions" "can_use_cluster_policyinstance_profile" {
  cluster_policy_id = databricks_cluster_policy.sandbox.id
  access_control {
    group_name       = var.databricks_principal
    permission_level = "CAN_USE"
  }
}

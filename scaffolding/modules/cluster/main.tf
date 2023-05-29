terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
  }
}

data "databricks_spark_version" "latest_lts" {
  long_term_support = true
}

resource "databricks_instance_profile" "shared" {
  instance_profile_arn = var.aws_instance_profile_arn
  iam_role_arn         = var.aws_instance_profile_role_arn
  skip_validation      = true
}

data "databricks_group" "this" {
  display_name = var.group_name
}

resource "databricks_group_role" "group_instance_profile" {
  group_id = data.databricks_group.this.id
  role     = databricks_instance_profile.shared.id
}

resource "databricks_cluster" "shared" {
  cluster_name            = "${var.cluster_name} ${data.databricks_spark_version.latest_lts.id}"
  data_security_mode      = "USER_ISOLATION"
  spark_version           = data.databricks_spark_version.latest_lts.id
  instance_pool_id        = var.instance_pool_id
  num_workers             = 1
  autotermination_minutes = 10
  aws_attributes {
    instance_profile_arn = databricks_instance_profile.shared.id
  }
}

resource "databricks_permissions" "cluster_usage" {
  cluster_id = databricks_cluster.shared.id

  access_control {
    group_name       = var.group_name
    permission_level = "CAN_MANAGE"
  }
}

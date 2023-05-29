terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
  }
}

data "databricks_node_type" "smallest" {
}

resource "databricks_instance_pool" "pool" {
  instance_pool_name = var.instance_pool_name
  min_idle_instances = 0
  max_capacity       = 2
  node_type_id       = data.databricks_node_type.smallest.id
  aws_attributes {
    availability           = var.availability
    zone_id                = "eu-central-1a"
    spot_bid_price_percent = "100"
  }
  idle_instance_autotermination_minutes = 10
  disk_spec {
    disk_type {
      ebs_volume_type = "GENERAL_PURPOSE_SSD"
    }
    disk_size  = 32
    disk_count = 1
  }
  custom_tags = var.custom_tags
}

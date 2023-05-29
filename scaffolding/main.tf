module "on_demand_instance_pool" {
  source = "./modules/instance_pool"

  instance_pool_name = "sandbox_on_demand"
  availability       = "ON_DEMAND"
  custom_tags = {
    Application = "DatabricksSandboxInfra"
  }
}

module "cluster" {
  source = "./modules/cluster"

  group_name                    = var.group_name
  cluster_name                  = "sandbox_on_demand"
  instance_pool_id              = module.on_demand_instance_pool.instance_pool_id
  aws_instance_profile_arn      = var.aws_instance_profile_arn
  aws_instance_profile_role_arn = var.aws_instance_profile_role_arn
}

module "storage_credential" {
  source                  = "./modules/storage_credential"
  storage_credential_name = var.external_s3_bucket_name
  aws_iam_role_name       = var.unity_catalog_s3_access_role_arn
  databricks_principal    = var.group_name
}

module "external_location_events" {
  source                 = "./modules/external_location"
  external_location_name = "${var.external_s3_bucket_name}-events"
  storage_credential_id  = module.storage_credential.storage_credential_id
  s3_prefix              = "s3://${var.external_s3_bucket_name}/events"
  databricks_principal   = var.group_name
  privileges             = ["READ_FILES"]
}

module "external_location_schemas" {
  source                 = "./modules/external_location"
  external_location_name = "${var.external_s3_bucket_name}-schemas"
  storage_credential_id  = module.storage_credential.storage_credential_id
  s3_prefix              = "s3://${var.external_s3_bucket_name}/schemas"
  databricks_principal   = var.group_name
  privileges             = ["READ_FILES", "WRITE_FILES"]
}

module "external_location_checkpoints" {
  source                 = "./modules/external_location"
  external_location_name = "${var.external_s3_bucket_name}-checkpoints"
  storage_credential_id  = module.storage_credential.storage_credential_id
  s3_prefix              = "s3://${var.external_s3_bucket_name}/checkpoints"
  databricks_principal   = var.group_name
  privileges             = ["READ_FILES", "WRITE_FILES"]
}

module "schema_grant" {
  source               = "./modules/schema_grant"
  catalog_name         = "main"
  schema_name          = "default"
  databricks_principal = var.group_name
  privileges           = ["CREATE_FUNCTION", "CREATE_TABLE", "USE_SCHEMA", "CREATE_MATERIALIZED_VIEW"]
}

module "sandbox_cluster_policy" {
  source               = "./modules/cluster_policy"
  databricks_principal = var.group_name
}

module "directory" {
  source               = "./modules/directory"
  path                 = "/Sandbox"
  databricks_principal = var.group_name
  permission_level     = "CAN_MANAGE"
}

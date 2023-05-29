terraform {
  backend "s3" {
    bucket = "lifecheq-sandbox-tfstate-admin"
    key    = "terraform_state_for_data_eng_eval"
    region = "eu-central-1"
  }
}

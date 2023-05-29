terraform {
  backend "s3" {
    bucket = "lifecheq-sandbox-tfstate"
    key    = "terraform_state_for_data_eng_solution"
    region = "eu-central-1"
  }
}

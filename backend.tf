terraform {
  backend "s3" {
    bucket = "rsschool-terraform-state-storage"
    key    = "tasks/terraform.tfstate"
    region = "ap-northeast-1"
    encrypt = true
  }
}
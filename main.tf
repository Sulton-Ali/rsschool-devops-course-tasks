provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_s3_bucket" "tf_state" {
  bucket = "terraform-test-bucket"
  tags = {
    Name        = "Terraform Test Bucket"
    Environment = "Dev"
  }
}

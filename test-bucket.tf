resource "aws_s3_bucket" "test_bucket" {
  bucket = "terraform-test-bucket"
  tags = {
    Name        = "Terraform Test Bucket"
    Environment = "Dev"
  }
}

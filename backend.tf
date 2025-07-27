/*
# s3 for storing terraform statefile
terraform {
  backend "s3" {
    bucket         = "terraform-statefile-bucket-123456"
    key            = "s3/terraform.tfstate"
    region         = "ap-south-1"
   # dynamodb_table = "terraform-locks"
   # encrypt        = true
  }
}
*/
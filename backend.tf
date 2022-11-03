# Configure S3 Backend
terraform {
  backend "s3" {
    bucket         = "onyi-terraform-state"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

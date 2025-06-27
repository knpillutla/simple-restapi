terraform {
  backend "s3" {
    bucket  = "your-org-terraform-state"
    key     = "dev/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

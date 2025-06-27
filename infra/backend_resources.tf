variable "state_bucket_name" {
  type        = string
  description = "Name of the S3 bucket to store Terraform state"
}

variable "region" {
  type        = string
  description = "AWS Region"
}

resource "aws_s3_bucket" "tf_state" {
  bucket = var.state_bucket_name

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "Terraform State Bucket"
  }
}

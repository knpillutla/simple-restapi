provider "aws" {
  region = var.region
}

module "ecr" {
  source              = "../../modules/ecr"
  ecr_repository_name = var.ecr_repository_name
  region              = var.region
}

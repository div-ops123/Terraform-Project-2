module "vpc" {
  source = "./modules/networking"
  cidr   = "10.0.0.0/16"
  cidr_tag = {
    Terraform   = "true"
    Environment = "dev"
    Name = "furniture-vpc"
  }
}
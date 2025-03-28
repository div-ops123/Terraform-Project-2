variable "cidr" {
  description = "CIDR block for the VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "cidr_tag" {
  description = "Tags for the VPC"
  type = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
    Name = "furniture-vpc"
  }
}
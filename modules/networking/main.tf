resource "aws_vpc" "furniture-vpc" {
  cidr_block = var.cidr
  tags = var.cidr_tag
}
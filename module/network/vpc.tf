resource "aws_vpc" "vpc_1" {
    cidr_block = var.cidr
    tags = {
      Name = var.tag
    }
  
}
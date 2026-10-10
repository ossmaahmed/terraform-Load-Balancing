resource "aws_subnet" "public_subnet" {
    count = 2
    vpc_id = aws_vpc.vpc_1.id
    
    cidr_block = var.subnet_public[count.index]
    availability_zone = var.zone[count.index]
    
    tags = {
      Name = var.tag_public[count.index]
    }


  
}


resource "aws_subnet" "private_subnet" {
  count = 2
  vpc_id = aws_vpc.vpc_1.id
  cidr_block = var.private_subnet[count.index]
  availability_zone = var.zone[count.index]
  tags = {
    Name = var.tag_private[count.index]
  }
}
resource "aws_internet_gateway" "igateway" {
  vpc_id = aws_vpc.vpc_1.id
  
}

resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "new-nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet[0].id

  depends_on = [aws_internet_gateway.igateway]
}

resource "aws_route_table" "public-route" {
  vpc_id = aws_vpc.vpc_1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igateway.id
    
  }
}
resource "aws_route_table" "private-route" {
  vpc_id = aws_vpc.vpc_1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.new-nat.id
    
  }
}
resource "aws_route_table_association" "public-subnet-association" {
  count          = length(aws_subnet.public_subnet)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public-route.id
  

}


resource "aws_route_table_association" "private-subnet-association" {
  count          = length(aws_subnet.private_subnet)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private-route.id
}
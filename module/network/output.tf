output "public_subnet_id" {
  value = aws_subnet.public_subnet[*].id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet[*].id
}

output "vpc_id" {
  value = aws_vpc.vpc_1.id
}
output "sg_web"{
  value = [aws_security_group.web-sg.id]
  
}
output "private_security_group"{
  value = [aws_security_group.private-sg.id]
  
}
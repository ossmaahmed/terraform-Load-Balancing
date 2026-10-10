output "ec2" {
  value = aws_instance.all_ec2[*].id
}
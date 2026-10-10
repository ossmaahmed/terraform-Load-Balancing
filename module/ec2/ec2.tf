
resource "aws_instance" "all_ec2" {
  count                  = 2
  ami                    = var.ami_id
  instance_type          = var.instance_type
  availability_zone      = var.zone_of_ec2[count.index]
  subnet_id              = var.subnet_id_ec2[count.index]
  vpc_security_group_ids = var.security_groups

  tags = {
    Name = var.tags_of_ec2[count.index]
  }
}
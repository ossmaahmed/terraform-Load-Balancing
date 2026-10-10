variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "subnet_id_ec2" {
  type = list(string)
}

variable "zone_of_ec2" {
  type = list(string)
}

variable "tags_of_ec2" {
  type = list(string)
}

variable "security_groups"{
  type = list(string)
}


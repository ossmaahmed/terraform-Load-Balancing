variable "cidr_vpc" {
    type = string
  
}
variable "tag_vpc" {
    type = string
  
}
variable "public_sub_env" {
    type = list(string)
  
}
variable "private_sub_env" {
    type = list(string)
  
}
variable "zones_of_sub" {
    type = list(string)
  
}
variable "tags_of_private" {
    type = list(string)
  
}


variable "tags_of_public" {
    type = list(string)
  
}

variable "ami_is" {
    type = string
  
}
variable "instance_type_is" {
    type = string
  
}
variable "type" {
    type = string
  
}
variable "type_of_lb" {

  type = string
}
variable "security_groups" {
  type = list(string)
}
variable "subnets_of_vpc" {
  type = list(string)

}
variable "vpc_id" {
  type = string
}
variable "target_of_instance" {
  type = list(string)
}

variable "name_prefix" {
  type = string
}

variable "internal" {
  type = bool
}
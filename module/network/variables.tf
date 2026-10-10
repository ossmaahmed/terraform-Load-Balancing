variable "cidr" {
    type = string
  
}
variable "tag" {
    type = string
  
}
variable "subnet_public" {
    type = list(string)
  
}
variable "zone" {
    type = list(string)

  
}
variable "tag_private" {
    type = list(string)


  
}
 

variable "tag_public" {
    type = list(string)


  
}
variable "private_subnet" {
    type = list(string)

}

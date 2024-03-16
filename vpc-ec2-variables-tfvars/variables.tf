#variables.tf

variable "ami_id" {
    description = "passing ami value to main.tf"
    type = string
    default = ""

  
}
variable "instance_type" {
    type = string
    default = ""

  
}
variable "key_name" {
    type = string
    default = ""
  
}

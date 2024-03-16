variable "ami_id" {
    description = "passing ami value to main.tf"
    type = string
    default = "ami-02d7fd1c2af6eead0"

  
}
variable "instance_type" {
    type = string
    default = "t2.micro"

  
}
variable "key_name" {
    type = string
    default = "pemkey"
  
}
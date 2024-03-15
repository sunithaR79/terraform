variable "ami_id" {
      type = string
    description = "passing AMI vlaue to  main.tf"
    default = "ami-02d7fd1c2af6eead0"
  
}
variable "instance_type" {
  type = string
  default = "t2.micro"
}

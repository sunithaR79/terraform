# launch ec2.tf
resource "aws_instance" "dev" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = aws_subnet.vpc79.id
    tags = {
      Name = "devdaaa"
    }
  
}
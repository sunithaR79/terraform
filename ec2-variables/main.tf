resource "aws_instance" "devdaa11" {
    ami = var.ami_id
    instance_type = var.instance_type
    tags = {
      Name = "test123"
    }
}

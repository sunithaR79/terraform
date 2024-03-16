#launch ec2

resource "aws_instance" "devdaa11" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    tags = {
      Name = "test123"
    }
}

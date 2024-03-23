#launch ec2

resource "aws_instance" "vpc1" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    key_name = "pemkey"
    subnet_id = aws_subnet.pub-SN.id
    associate_public_ip_address = true
    security_groups = [aws_security_group.cust-SG.id]
    tags = {
      Name = "Bastion123"
    }
  
}

resource "aws_instance" "vpc2" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    key_name = "pemkey"
    subnet_id = aws_subnet.pvt-SN.id
    associate_public_ip_address = false
    security_groups = [aws_security_group.cust-SG.id]
    tags = {
      Name = "private server"
    }
  
}


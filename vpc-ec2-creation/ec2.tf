#launch ec2

resource "aws_instance" "vpc1" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    key_name = "pemkey"
    subnet_id = aws_subnet.vpc1-pub-SN.id
    tags = {
      Name = "dev-ec2"
    }
  
}

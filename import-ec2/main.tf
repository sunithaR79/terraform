resource "aws_instance" "server" {
  ami = "ami-02d7fd1c2af6eead0"
  instance_type = "t3.micro"

}
resource "aws_instance" "name" {
   ami = "ami-04ff98ccbfa41c9ad"
   instance_type = "t2.micro"
   key_name = "pemkey"
   user_data = file("userdata.sh")
}
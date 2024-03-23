#create VPC
resource "aws_vpc" "vpc1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc"
  }
}

#create internet gateway and attach to VPC
resource "aws_internet_gateway" "vpc1-IGW" {
    vpc_id = aws_vpc.vpc1.id
}

#Create Public-subnet
resource "aws_subnet" "pub-SN" {
  cidr_block = "10.0.0.0/24"
  vpc_id = aws_vpc.vpc1.id
}

#Create Private-subnet
resource "aws_subnet" "pvt-SN" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.vpc1.id
}

#Create Public RT and attaching IGW to PRT
resource "aws_route_table" "pub-RT" {
  vpc_id = aws_vpc.vpc1.id
  route  {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.vpc1-IGW.id
  }
}

#Associating Pub-RT to PUB-SN
resource "aws_route_table_association" "vpc1" {
  route_table_id = aws_route_table.pub-RT.id
  subnet_id = aws_subnet.pub-SN.id
}

#create Elastic-IP address
resource "aws_eip" "Elastic-IP" {
  tags = {
    Name = "eip"
  }
}

#Create NAT-Gateway in Public Subnet
resource "aws_nat_gateway" "NAT-gateway" {
   subnet_id = aws_subnet.pub-SN.id
   allocation_id = aws_eip.Elastic-IP.id
   tags = {
    Name = "NAT_gateway"
   }
}

#Attach NAT_Gateway to Private RT
resource "aws_route_table" "pvt-RT" {
  vpc_id = aws_vpc.vpc1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NAT-gateway.id
  }
}

#Associate PrivateRT to private SN
resource "aws_route_table_association" "pvt-RT" {
  route_table_id = aws_route_table.pvt-RT.id
  subnet_id = aws_subnet.pvt-SN.id
}

#Create Security Group
resource "aws_security_group" "cust-SG" {
  name = "allow_tls"
  vpc_id = aws_vpc.vpc1.id
  tags = {
    Name = "SG-VPC1"
  }
ingress {
  description = "TLS from VPC"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ]
}
ingress {
  description = "TLS from VPC"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ]
}
egress {
  description = "TLS from VPC"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = [ "0.0.0.0/0" ]
}
}


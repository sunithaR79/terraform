# 1.Create VPC
resource "aws_vpc" "vpc79" {
  cidr_block =  "10.0.0.0/16"
  tags = {
    Name = "terra-vpc"
  }
}

#2.Create Subnets
resource "aws_subnet" "vpc79" {
  vpc_id = aws_vpc.vpc79.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "tf-pub-SN"
  }
}

#3.Create IGW & Attach to VPC
resource "aws_internet_gateway" "vpc79-IGW" {
  vpc_id = aws_vpc.vpc79.id
}

#4. Create Route Table
#5. Edit routes allowing internet to route table
resource "aws_route_table" "Pub-route" {
  vpc_id = aws_vpc.vpc79.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc79-IGW.id
  }
}

#6.Allowing internet to subnet
#7.Subnet Association
resource "aws_route_table_association" "vpc79" {
    route_table_id = aws_route_table.Pub-route.id
    subnet_id = aws_subnet.vpc79.id
}




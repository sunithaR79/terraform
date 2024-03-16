# 1.create VPC
resource "aws_vpc" "vpc1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "cust-vpc"
  }
}

# 2. Create IGW and Attach to VPC
resource "aws_internet_gateway" "vpc1-IGW" {
    vpc_id = aws_vpc.vpc1.id
}

# 3. Create Public Subnet 
resource "aws_subnet" "vpc1-pub-SN" {
  vpc_id = aws_vpc.vpc1.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "cust-vpc-pubSN"
  }
}

# 4. Create Public RT and Attach IGW to RT
resource "aws_route_table" "vpc1-pub-RT" {
vpc_id = aws_vpc.vpc1.id
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc1-IGW.id
}
}

# 5. public Subnet Associate with Public RT
resource "aws_route_table_association" "vpc1" {
    route_table_id = aws_route_table.vpc1-pub-RT.id
    subnet_id = aws_subnet.vpc1-pub-SN.id
}


  

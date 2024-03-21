#----------Creation du VPC----------
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc-cidr-block
  tags = {
    Name = var.vpc-name
  }
}
#----------Creation des deux Public or Web Subnets----------
resource "aws_subnet" "web-subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.web-subnet1-cidr
  availability_zone       = var.az-1
  map_public_ip_on_launch = true

  tags = {
    Name = var.web-subnet1-name
  }
}
resource "aws_subnet" "web-subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.web-subnet2-cidr
  availability_zone       = var.az-2
  map_public_ip_on_launch = true

  tags = {
    Name = var.web-subnet2-name
  }
}
#---------Creation des deux privates or Application Subnets----------
resource "aws_subnet" "app-subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.app-subnet1-cidr
  availability_zone       = var.az-1
  map_public_ip_on_launch = false

  tags = {
    Name = var.app-subnet1-name
  }
}
resource "aws_subnet" "app-subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.app-subnet2-cidr
  availability_zone       = var.az-2
  map_public_ip_on_launch = false

  tags = {
    Name = var.app-subnet2-name
  }
}
#----------Creation des deux privates or DataBase subnets-----------
resource "aws_subnet" "db-subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.db-subnet1-cidr
  availability_zone       = var.az-1
  map_public_ip_on_launch = false
  tags = {
    Name = var.db-subnet1-name
  }
}
resource "aws_subnet" "db-subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.db-subnet2-cidr
  availability_zone       = var.az-2
  map_public_ip_on_launch = true
  tags = {
    Name = var.db-subnet2-name
  }
}
#----------Creation InternetGateWay----------
resource "aws_internet_gateway" "internet-gw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = var.igw-name
  }
}
#----------Creation du Elastic IP----------
resource "aws_eip" "eip" {
  domain = "vpc"
}
#----------Creation du NatGateway et allocation de l eslastic IP----------
resource "aws_nat_gateway" "nat-gw" {
  allocation_id     = aws_eip.eip.id
  connectivity_type = "public"
  subnet_id         = aws_subnet.web-subnet1.id
  tags = {
    Name = var.nat-gw-name
  }
  depends_on = [aws_internet_gateway.internet-gw]
}
#----------Creation du Public Route table--------
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gw.id
  }
  tags = {
    Name = var.public-rt-name
  }
}
#----------Association of public subnets to the public route table
resource "aws_route_table_association" "pub-rt-asscociation-1" {
  subnet_id      = aws_subnet.web-subnet1.id
  route_table_id = aws_route_table.public-route-table.id
}
resource "aws_route_table_association" "pub-rt-asscociation-2" {
  subnet_id      = aws_subnet.web-subnet2.id
  route_table_id = aws_route_table.public-route-table.id
}
#--------Creation of Private route table----------
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = {
    Name = var.private-rt-name
  }
}
#----------Association of privates subnets to the private route table----------
resource "aws_route_table_association" "pri-rt-asscociation-1" {
  subnet_id      = aws_subnet.app-subnet1.id
  route_table_id = aws_route_table.private-route-table.id
}
resource "aws_route_table_association" "pri-rt-asscociation-2" {
  subnet_id      = aws_subnet.app-subnet2.id
  route_table_id = aws_route_table.private-route-table.id
}
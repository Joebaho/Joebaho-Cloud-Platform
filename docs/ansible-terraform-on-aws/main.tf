
# ZONE OF DATA SOURCE

# Declare the data source for AZ
data "aws_availability_zones" "az" {
  state = "available"
}
# Declare the data source for the latest AMI Linux 
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
#Declare the data source for the latest AMI Ubuntu 
data "aws_ami" "ubuntu" {
    most_recent = true
    owners = ["099720109477"] # 
    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}
# Create Amazon linux controller
resource "aws_instance" "linux-controller" {
  instance_type = var.instance_type
  ami           = data.aws_ami.amazon_linux_2.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  key_name      = var.key_name
  user_data     = filebase64("${path.module}/user_data.sh")
  tags = {
    Name = "linux-controller"
  }
}

# Create Amazon linux server
resource "aws_instance" "linux-server" {
  count         = var.number
  instance_type = var.instance_type
  ami           = data.aws_ami.amazon_linux_2.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  key_name      = var.key_name
  tags = {
    "Name" = "linux-server-${count.index + 1}"
  }
}
#Create ubuntu server 
resource "aws_instance" "ubuntu-server" {
  count         = var.number
  instance_type = var.instance_type
  ami           = data.aws_ami.ubuntu.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  key_name      = var.key_name
  tags = {
    "Name" = "ubuntu-server-${count.index + 1}"
  }
}

resource "aws_security_group" "web_sg" {
  #vpc_id      = data.aws_vpc.default.id
  description = "security group for server"
  name        = "web_sg"

  ingress {
    from_port       = var.port_number[0] #80
    to_port         = var.port_number[0] #80
    protocol    = "tcp"
    cidr_blocks = [var.public_cidr]
  }
  ingress {
    from_port       = var.port_number[1] #22
    to_port         = var.port_number[1] #22
    protocol    = "tcp"
    cidr_blocks = [var.public_cidr]
  }
  egress {
    from_port   = var.port_number[2] #0
    to_port     = var.port_number[2] #0
    protocol    = "-1"
    cidr_blocks = [var.public_cidr]
  }
  tags = {
    "Name" = "web_sg"
  }
}
# D
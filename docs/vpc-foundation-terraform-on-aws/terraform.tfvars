vpc_cidr             = "10.0.0.0/16"
public_cidr          = "0.0.0.0/0"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
aws_region           = "us-west-2"
port_number          = ["22", "80", "443", "0"]
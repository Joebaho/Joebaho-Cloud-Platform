# ZONE OF ALL VARIABLES USE IN THIS CODE

# variable declarations for the public_cidr
variable "public_cidr" {
  type = string
}
# variable declarations for the vpc_cidr
variable "vpc_cidr" {
  type = string
}
# variable declaration for the vpc aws region
variable "aws_region" {
  type = string
}
# Declarations for the two public_subnet_cidrs
variable "public_subnet_cidrs" {
  type = list(string)
}
# Declarations for the two private_subnet_cidrs
variable "private_subnet_cidrs" {
  type = list(string)
}
variable "port_number" {
  type        = list(number)
  description = "list of port number for security group ingress and egress rules"
}
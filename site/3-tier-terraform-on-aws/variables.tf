#Lists of all variables that will be use in the project
#----------Region----------  
variable "region-name" {
  description = "Region name"
}
#----------CIDR Block of the VPC----------
variable "vpc-cidr-block" {
  description = "CIDR Block for VPC"
}
#----------Name of the VPC----------
variable "vpc-name" {
  description = "Name for Virtual Private Cloud"
}
#----------Name of the IGW----------
variable "igw-name" {
  description = "Name for Internet Gateway"
}
#-----------Name of the NATGateway----------
variable "nat-gw-name" {
  description = "Name for NAT Gateway"
}
#----------CDIR Block of the web subnet 1----------
variable "web-subnet1-cidr" {
  description = "CIDR Block for Web-tier Subnet-1"
}
#----------Name of the web subnet 1----------
variable "web-subnet1-name" {
  description = "Name for Web-tier Subnet-1"
}
#----------CDI Block of the web subnet 2----------
variable "web-subnet2-cidr" {
  description = "CIDR Block for Web-tier Subnet-2"
}
#----------Name of the web subnet 2----------
variable "web-subnet2-name" {
  description = "Name for Web-tier Subnet-2"
}
#----------CDIR Block of the App subnet 1-------------
variable "app-subnet1-cidr" {
  description = "CIDR Block for Application-tier Subnet-1"
}
#----------Name of the App subnet 1------------
variable "app-subnet1-name" {
  description = "Name for app-tier Subnet-1"
}
#----------CDIR Block of the app subnet2-----------
variable "app-subnet2-cidr" {
  description = "CIDR Block for Application-tier Subnet-2"
}
#----------Name of the App subnet 2----------
variable "app-subnet2-name" {
  description = "Name for Application-tier Subnet-2"
}
#-----------CDIR Block of DB subnet 1---------
variable "db-subnet1-cidr" {
  description = "CIDR Block for Database-tier Subnet-1"
}
#---------- Name of the DB subnet1-----------
variable "db-subnet1-name" {
  description = "Name for Database-tier Subnet-1"
}
#----------CDIR Block of DB subnet 2-----------
variable "db-subnet2-cidr" {
  description = "CIDR Block for Database-tier Subnet-2"
}
#----------Name of the BD subnet2-----------
variable "db-subnet2-name" {
  description = "Name for Database-tier Subnet-2"
}
#----------name of the AZ 1-----------
variable "az-1" {
  description = "Availabity Zone 1"
}
#---------- Name of the AZ 2-----------
variable "az-2" {
  description = "Availabity Zone 2"
}
#---------- Name of the public route table-----------
variable "public-rt-name" {
  description = "Name for Public Route table"
}
#---------- Name of the private route table-----------
variable "private-rt-name" {
  description = "Name for Private Route table"
}
#----------- Name of the web launch Template---------- 
variable "launch-template-web-name" {
  description = "Name for Launch-template-1"
}
#---------- Name of the instance type -----------
variable "instance-type" {
  description = "Value for Instance type"
}
#---------- Name of the key pair ---------
variable "key-name" {
  description = "Value for Key name"
}
#---------- Name of the web instance ----------
variable "web-instance-name" {
  description = "Value for Web Instances"
}
#---------- Name of the ALB for the web ---------- 
variable "alb-web-name" {
  description = "Name the Load Balancer for the Web Tier"
}
#---------- Name of the security group for the web ALB -----------
variable "alb-sg-web-name" {
  description = "Name for alb security group 1"
}
#----------- Name of the autoscaling group of the web -----------
variable "asg-web-name" {
  description = "Name the Auto Scaling group in Web Tier"
}
#---------- Name of the autoscaling group of the web ----------
variable "asg-sg-web-name" {
  description = "Name for asg security group 1"
}
#---------- Name of the Target group of the web -----------
variable "tg-web-name" {
  description = "Name for Target group web"
}
#---------- Name of the application launch template----------
variable "launch-template-app-name" {
  description = "Name for Launch-template-1"
}
#---------- Name of the appplication instance -----------
variable "app-instance-name" {
  description = "Value for App Instances"
}
#----------- Name of the ALB for the application -----------
variable "alb-app-name" {
  description = "Name the Load Balancer for the App Tier"
}
#---------- Name of the ALB security group for the Application ----------
variable "alb-sg-app-name" {
  description = "Name for alb security group 1"
}
#---------- Name of the Autoscaling group for the application ----------
variable "asg-app-name" {
  description = "Name the Auto Scaling group in app Tier"
}
#---------- Name for the security group for the application ----------
variable "asg-sg-app-name" {
  description = "Name for asg security group 1"
}
#---------- Name for the Target group for application ----------
variable "tg-app-name" {
  description = "Name for Target group app"
}
#----------- Name for the Data base-----------
variable "db-username" {
  description = "Username for db instance"
}
#---------- Password of the data base -----------
variable "db-password" {
  description = "Password for db instance"
}
#---------- Name of the Data base administrator ------------
variable "db-name" {
  description = "Name for Database"
}
#----------- Instance class for the Data base -----------
variable "instance-class" {
  description = "Value for DB instance class"
}
#---------- Name of the dataase security group ----------
variable "db-sg-name" {
  description = "Name for DB Security group"
}
#---------- Name of the group of subnets where Data base will be launched ----------
variable "db-subnet-grp-name" {
  description = "Name for DB Subnet Group"
}
#----------- Name of the Data base security group -----------
variable "app-db-sg-name" {
  description = "Name for App-DB SEcurity group"
}
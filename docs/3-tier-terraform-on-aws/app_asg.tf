#----------DataSource pour AMI: retrieving the latest version of the AMI in AWS -----------
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
#-----------AutoScaling Group for the Application-----------
resource "aws_autoscaling_group" "asg-app" {
  name                = var.asg-app-name
  desired_capacity    = 2
  max_size            = 4
  min_size            = 1
  target_group_arns   = [aws_lb_target_group.target-group-app.arn]
  health_check_type   = "EC2"
  vpc_zone_identifier = [aws_subnet.app-subnet1.id, aws_subnet.app-subnet2.id]
  launch_template {
    id      = aws_launch_template.template-app.id
    version = aws_launch_template.template-app.latest_version
  }
}
#---------- AutoScaling Security Group for application----------
resource "aws_security_group" "asg-security-group-app" {
  name        = var.asg-sg-app-name
  description = "ASG Security Group"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "HTTP from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb-security-group-app.id]
  }

  ingress {
    description     = "SSH From Anywhere or Your-IP"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.asg-security-group-web.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.asg-sg-app-name
  }
}
#-----------launch template for application-------------
resource "aws_launch_template" "template-app" {
  name          = var.launch-template-app-name
  image_id      = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance-type
  key_name      = var.key-name

  network_interfaces {
    device_index    = 0
    security_groups = [aws_security_group.asg-security-group-app.id]
  }

  tag_specifications {

    resource_type = "instance"
    tags = {
      Name = var.app-instance-name
    }
  }
}
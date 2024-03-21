#-----------Creaton ALB for application-----------
resource "aws_lb" "alb-app" {
  name               = var.alb-app-name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-security-group-app.id]
  subnets            = [aws_subnet.app-subnet1.id, aws_subnet.app-subnet2.id]
}
#------------ Creation of ALB Security Group for Application---
resource "aws_security_group" "alb-security-group-app" {
  name        = var.alb-sg-app-name
  description = "ALB Security Group"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "HTTP from Internet"
    from_port       = 80
    to_port         = 80
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
    Name = var.alb-sg-app-name
  }
}
#----------- Creation of Target Group for the Application-----------
resource "aws_lb_target_group" "target-group-app" {
  name     = var.tg-app-name
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
  health_check {
    path    = "/"
    matcher = 200

  }
}
resource "aws_lb_listener" "alb_listener-app" {
  load_balancer_arn = aws_lb.alb-app.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group-app.arn
  }
}

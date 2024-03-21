#---------- Section to display the ouput of the web alb dns----------
output "web-server-dns" {
  value = aws_lb.alb-web.dns_name
}
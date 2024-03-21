# OUTPUTS SECTION

#output linux-server

#output of the public Ip 
output "linux_public_Ip" {
  value = aws_instance.linux-server[*].public_ip
}
#output of the pivate Ip 
output "linux_private_Ip" {
  value = aws_instance.linux-server[*].private_ip
}
output "linux_Ids" {
  value = aws_instance.linux-server[*].id
}
#output ubuntu server

#output of the public Ip 
output "ubuntu_public_Ip" {
  value = aws_instance.ubuntu-server[*].public_ip
}
#output of the pivate Ip 
output "ubuntu_private_Ip" {
  value = aws_instance.ubuntu-server[*].private_ip
}
output "ubuntu_Ids" {
  value = aws_instance.ubuntu-server[*].id
}

output "public_subnet1_id" {
  value = aws_subnet.subnet["public_subnet1"].id
}
output "public_subnet2_id" {
  value = aws_subnet.subnet["public_subnet2"].id
}
output "private_subnet1_id" {
  value = aws_subnet.subnet["private_subnet1"].id
}
output "private_subnet2_id" {
  value = aws_subnet.subnet["private_subnet2"].id
}
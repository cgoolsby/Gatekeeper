output "public_subnet_ids" {
  type = "list"
  value = ["${aws_subnet.public.*.id}"]
}
output "private_subnet_id" {
  type = "list"
  value = ["${aws_subnet.private.*.id}"]
}

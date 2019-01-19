output "igw_id" {
  description = "the ID of the IGW"
  value = "${aws_internet_gateway.igw.id}"
}

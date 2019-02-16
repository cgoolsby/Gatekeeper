resource "aws_ebs_volume" "example" {
  availability_zone = "${var.availability_zone_ebs}"
  size              = 40

  tags = {
    Name = "HelloWorld"
  }
}

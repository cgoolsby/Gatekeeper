resource "aws_ebs_volume" "EKS_lb" {
  availability_zone = "${var.availability_zone_ebs}"
  size              = 40

  tags = {
    Name = "EKS_lb"
  }
}

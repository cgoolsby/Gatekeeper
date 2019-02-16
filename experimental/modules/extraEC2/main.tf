data "aws_ami" "ubuntu" {
    most_recent = true
filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
}

filter {
    name   = "virtualization-type"
    values = ["hvm"]
}

owners = ["099720109477"] # Canonical
}


resource "aws_instance" "web" {
  count = "${var.extraEC2count}"

  instance_type = "${var.aws_instance_type}"
  ami           = "${data.aws_ami.ubuntu.id}"
  key_name = "${var.aws_key_name}"
  vpc_security_group_ids = ["${var.sg-ssh_id}", "${var.sg-BH_Cluster_id}"]
  ####PUBLIC
  associate_public_ip_address = true
  subnet_id = "${var.public_subnet_id}"
}

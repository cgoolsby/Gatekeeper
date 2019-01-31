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


resource "aws_instance" "bastion" {
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  monitoring = true
  vpc_security_group_ids = ["${var.sg-bastion_id}", "${var.sg-ssh_id}"]
  associate_public_ip_address = true
  subnet_id = "${var.public_subnet_id}"
  tags {
    Name = "${terraform.workspace}-bastion"
  }
}

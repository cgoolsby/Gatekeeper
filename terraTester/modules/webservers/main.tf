data "aws_availability_zones" "available" {}
resource "aws_elb" "web" {
    name = "terraform"
    subnets = ["${var.public_subnet_id}"]
    listener {
        instance_port       = 80
        instance_protocol   = "http"
        lb_port             = 80
        lb_protocol         = "http"
    }

#    availability_zones = [
#        "${element(data.aws_availability_zones.available.names, count.index)}"
#    ]

    instances = [
        "${aws_instance.web.*.id}",
    ]
}

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
    count = 2 #TD "${var.web_instance_count}"

    instance_type = "t2.micro" # "${var.aws_instance_type}"
    ami           = "${data.aws_ami.ubuntu.id}"
#    availability_zone = "${element(data.aws_availability_zones.available.names, count.index)}"

    key_name = "${var.aws_key_name}"
    vpc_security_group_ids = [ "${var.sg-ssh_id}", "${var.sg-http_id}", "${var.sg-https_id}"]
#####Public to Private swap lines
    associate_public_ip_address = true
    subnet_id = "${var.public_subnet_id}"
#####
    connection {
        user = "${var.aws_instance_user}"
        private_key = "${file("${var.aws_key_path}")}"
    }

    provisioner "local-exec" {
      command = "echo ${var.github_link} >> ./modules/webservers/files/github.txt"
    }

    provisioner "file" {
        source = "./modules/webservers/files/"
        destination = "/home/ubuntu"
    }

    provisioner "remote-exec" {
      inline = [ "mkdir jenkins" ]
    }

    provisioner "file" {
        source = "./modules/webservers/jenkins/"
        destination = "/home/ubuntu/jenkins/"
    }

    provisioner "remote-exec" {
        inline = [
            "sleep 120; sudo apt-get update; sudo apt-get install -y software-properties-common; sudo apt-get install -y ansible",
            #"curl -fsSL https://get.docker.com -o get-docker.sh",
            "sh get-docker.sh",
            "sudo bash deploy.sh"
#            "sudo docker build ###DOCKERFILE"
#            "sudo docker run"
#            "sudo docker pull nginx",
#            "sudo docker run -d -p 80:80 -v /tmp:/usr/share/nginx/html --name nginx_${count.index} nginx",
#            "sudo sed -iE \"s/{{ hostname }}/`hostname`/g\" /tmp/index.html",
#            "sudo sed -iE \"s/{{ container_name }}/nginx_${count.index}/g\" /tmp/index.html"
        ]
    }

   tags { 
     Name = "Terraform web ${count.index}"
   }
}


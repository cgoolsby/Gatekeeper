


















provisioner "remote-exec" {
  docker run --name jenkins-docker -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock ##insight##/jenkins-docker #TODO

}

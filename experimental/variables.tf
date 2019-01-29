variable "key_name" {
  description = ".pem prefix"
  default = "keyDesktop"
}
variable "key_path" {
  description = ".pem suffix included"
  default = "~/.ssh/keyDesktop.pem"
}
variable "github_link" {
  description = "link to github w/ your flask app"
#  default = "https://github.com/cgoolsby/simpleFlaskTester"
  default = "cgoolsby/simpleFlaskTester"
}
variable "EKS_nodes" {
  default = 2
}
variable "Node_type" {
  default = "t2.micro"
}

variable "vpc_id" {
  description = "the vpc networks id"
}

data "http" "ip-address" {
  url = "http://ipv4.icanhazip.com"
}

locals  {
  ipAddress = "${chomp(data.http.ip-address.body)}/32"
}

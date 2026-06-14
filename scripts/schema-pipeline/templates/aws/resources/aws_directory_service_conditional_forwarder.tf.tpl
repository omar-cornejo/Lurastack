# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_directory_service_conditional_forwarder         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_directory_service_conditional_forwarder" "this" {

  directory_id       = ""     # string | required
  dns_ips            = []     # list(string) | required
  remote_domain_name = ""     # string | required
  id                 = ""     # string | optional+computed

}


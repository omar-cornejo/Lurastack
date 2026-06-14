# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_proxy_protocol_policy                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_proxy_protocol_policy" "this" {

  instance_ports = []     # set(string) | required
  load_balancer  = ""     # string | required
  id             = ""     # string | optional+computed

}


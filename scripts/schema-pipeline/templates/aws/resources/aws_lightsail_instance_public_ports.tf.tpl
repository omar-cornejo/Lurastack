# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lightsail_instance_public_ports                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lightsail_instance_public_ports" "this" {

  instance_name = ""     # string | required
  id            = ""     # string | optional+computed

  port_info { # set [1..*]
    from_port         = 0      # number | required
    protocol          = ""     # string | required
    to_port           = 0      # number | required
    cidr_list_aliases = []     # set(string) | optional+computed
    cidrs             = []     # set(string) | optional+computed
    ipv6_cidrs        = []     # set(string) | optional+computed

  }

}


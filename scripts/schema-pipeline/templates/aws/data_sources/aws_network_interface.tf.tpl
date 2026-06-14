# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_network_interface                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_network_interface" "this" {

  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # association = [  # list(object)
  #   {
  #     allocation_id = ""
  #     association_id = ""
  #     carrier_ip = ""
  #     customer_owned_ip = ""
  #     ip_owner_id = ""
  #     public_dns_name = ""
  #     public_ip = ""
  #   }
  # ]
  # attachment = [  # list(object)
  #   {
  #     attachment_id = ""
  #     device_index = 0
  #     instance_id = ""
  #     instance_owner_id = ""
  #   }
  # ]
  # availability_zone = ""     # string | computed
  # description       = ""     # string | computed
  # interface_type    = ""     # string | computed
  # ipv6_addresses    = []     # set(string) | computed
  # mac_address       = ""     # string | computed
  # outpost_arn       = ""     # string | computed
  # owner_id          = ""     # string | computed
  # private_dns_name  = ""     # string | computed
  # private_ip        = ""     # string | computed
  # private_ips       = []     # list(string) | computed
  # requester_id      = ""     # string | computed
  # security_groups   = []     # set(string) | computed
  # subnet_id         = ""     # string | computed
  # vpc_id            = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}


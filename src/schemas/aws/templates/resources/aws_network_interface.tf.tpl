# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_network_interface                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_network_interface" "this" {

  subnet_id                 = ""     # string | required
  description               = ""     # string | optional
  enable_primary_ipv6       = false  # bool | optional+computed
  id                        = ""     # string | optional+computed
  interface_type            = ""     # string | optional+computed
  ipv4_prefix_count         = 0      # number | optional+computed
  ipv4_prefixes             = []     # set(string) | optional+computed
  ipv6_address_count        = 0      # number | optional+computed
  ipv6_address_list         = []     # list(string) | optional+computed
  ipv6_address_list_enabled = false  # bool | optional
  ipv6_addresses            = []     # set(string) | optional+computed
  ipv6_prefix_count         = 0      # number | optional+computed
  ipv6_prefixes             = []     # set(string) | optional+computed
  private_ip                = ""     # string | optional+computed
  private_ip_list           = []     # list(string) | optional+computed
  private_ip_list_enabled   = false  # bool | optional
  private_ips               = []     # set(string) | optional+computed
  private_ips_count         = 0      # number | optional+computed
  security_groups           = []     # set(string) | optional+computed
  source_dest_check         = false  # bool | optional
  tags                      = {}     # map(string) | optional
  tags_all                  = {}     # map(string) | optional+computed

  # arn                       = ""     # string | computed
  # mac_address               = ""     # string | computed
  # outpost_arn               = ""     # string | computed
  # owner_id                  = ""     # string | computed
  # private_dns_name          = ""     # string | computed

  attachment { # set
    device_index  = 0      # number | required
    instance      = ""     # string | required

    # attachment_id = ""     # string | computed

  }

}


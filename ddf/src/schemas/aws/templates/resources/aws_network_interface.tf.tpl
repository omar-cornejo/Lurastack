# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_network_interface                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_network_interface" "this" {

  subnet_id                 = ""     # string | required
  description               = ""     # string | optional
  enable_primary_ipv6       = false  # bool | optional+computed
  id                        = ""     # string | optional+computed
  interface_type            = ""     # string | optional+computed
  ipv4_prefix_count         = 0      # number | optional+computed
  ipv4_prefixes             = []     # set of string | optional+computed
  ipv6_address_count        = 0      # number | optional+computed
  ipv6_address_list         = []     # list of string | optional+computed
  ipv6_address_list_enabled = false  # bool | optional
  ipv6_addresses            = []     # set of string | optional+computed
  ipv6_prefix_count         = 0      # number | optional+computed
  ipv6_prefixes             = []     # set of string | optional+computed
  private_ip                = ""     # string | optional+computed
  private_ip_list           = []     # list of string | optional+computed
  private_ip_list_enabled   = false  # bool | optional
  private_ips               = []     # set of string | optional+computed
  private_ips_count         = 0      # number | optional+computed
  security_groups           = []     # set of string | optional+computed
  source_dest_check         = false  # bool | optional
  tags                      = {}     # map of string | optional
  tags_all                  = {}     # map of string | optional+computed
  # arn                       = ... # string | computed
  # mac_address               = ... # string | computed
  # outpost_arn               = ... # string | computed
  # owner_id                  = ... # string | computed
  # private_dns_name          = ... # string | computed

  attachment {
    device_index  = 0      # number | required
    instance      = ""     # string | required
    # attachment_id = ... # string | computed
  }

}


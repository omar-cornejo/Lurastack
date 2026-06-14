# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_eip                                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_eip" "this" {

  id                         = ""     # string | optional+computed
  public_ip                  = ""     # string | optional+computed
  tags                       = {}     # map(string) | optional+computed

  # arn                        = ""     # string | computed
  # association_id             = ""     # string | computed
  # carrier_ip                 = ""     # string | computed
  # customer_owned_ip          = ""     # string | computed
  # customer_owned_ipv4_pool   = ""     # string | computed
  # domain                     = ""     # string | computed
  # instance_id                = ""     # string | computed
  # ipam_pool_id               = ""     # string | computed
  # network_interface_id       = ""     # string | computed
  # network_interface_owner_id = ""     # string | computed
  # private_dns                = ""     # string | computed
  # private_ip                 = ""     # string | computed
  # ptr_record                 = ""     # string | computed
  # public_dns                 = ""     # string | computed
  # public_ipv4_pool           = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}


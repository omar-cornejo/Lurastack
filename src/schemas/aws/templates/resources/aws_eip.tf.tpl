# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_eip                                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_eip" "this" {

  address                   = ""     # string | optional
  associate_with_private_ip = ""     # string | optional
  customer_owned_ipv4_pool  = ""     # string | optional
  domain                    = ""     # string | optional+computed
  id                        = ""     # string | optional+computed
  instance                  = ""     # string | optional+computed
  ipam_pool_id              = ""     # string | optional+computed
  network_border_group      = ""     # string | optional+computed
  network_interface         = ""     # string | optional+computed
  public_ipv4_pool          = ""     # string | optional+computed
  tags                      = {}     # map(string) | optional
  tags_all                  = {}     # map(string) | optional+computed
  vpc                       = false  # bool | optional+computed+DEPRECATED

  # allocation_id             = ""     # string | computed
  # arn                       = ""     # string | computed
  # association_id            = ""     # string | computed
  # carrier_ip                = ""     # string | computed
  # customer_owned_ip         = ""     # string | computed
  # private_dns               = ""     # string | computed
  # private_ip                = ""     # string | computed
  # ptr_record                = ""     # string | computed
  # public_dns                = ""     # string | computed
  # public_ip                 = ""     # string | computed

  timeouts { # single
    delete = ""     # string | optional
    read   = ""     # string | optional
    update = ""     # string | optional

  }

}


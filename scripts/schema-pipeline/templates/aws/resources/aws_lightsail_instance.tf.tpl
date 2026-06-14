# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lightsail_instance                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lightsail_instance" "this" {

  availability_zone  = ""     # string | required
  blueprint_id       = ""     # string | required
  bundle_id          = ""     # string | required
  name               = ""     # string | required
  id                 = ""     # string | optional+computed
  ip_address_type    = ""     # string | optional
  key_pair_name      = ""     # string | optional
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed
  user_data          = ""     # string | optional

  # arn                = ""     # string | computed
  # cpu_count          = 0      # number | computed
  # created_at         = ""     # string | computed
  # ipv6_addresses     = []     # list(string) | computed
  # is_static_ip       = false  # bool | computed
  # private_ip_address = ""     # string | computed
  # public_ip_address  = ""     # string | computed
  # ram_size           = 0      # number | computed
  # username           = ""     # string | computed

  add_on { # list [0..1]
    snapshot_time = ""     # string | required
    status        = ""     # string | required
    type          = ""     # string | required

  }

}


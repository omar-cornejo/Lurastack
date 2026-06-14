# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_instance_connect_endpoint                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_instance_connect_endpoint" "this" {

  subnet_id             = ""     # string | required
  preserve_client_ip    = false  # bool | optional+computed
  security_group_ids    = []     # set(string) | optional+computed
  tags                  = {}     # map(string) | optional

  # arn                   = ""     # string | computed
  # availability_zone     = ""     # string | computed
  # dns_name              = ""     # string | computed
  # fips_dns_name         = ""     # string | computed
  # id                    = ""     # string | computed
  # network_interface_ids = []     # list(string) | computed
  # owner_id              = ""     # string | computed
  # tags_all              = {}     # map(string) | computed
  # vpc_id                = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_managed_prefix_list                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_managed_prefix_list" "this" {

  address_family = ""     # string | required
  max_entries    = 0      # number | required
  name           = ""     # string | required
  id             = ""     # string | optional+computed
  tags           = {}     # map(string) | optional
  tags_all       = {}     # map(string) | optional+computed

  # arn            = ""     # string | computed
  # owner_id       = ""     # string | computed
  # version        = 0      # number | computed

  entry { # set
    cidr        = ""     # string | required
    description = ""     # string | optional

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_managed_prefix_list                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_managed_prefix_list" "this" {

  id             = ""     # string | optional+computed
  name           = ""     # string | optional+computed
  tags           = {}     # map(string) | optional+computed

  # address_family = ""     # string | computed
  # arn            = ""     # string | computed
  # entries = [  # set(object)
  #   {
  #     cidr = ""
  #     description = ""
  #   }
  # ]
  # max_entries    = 0      # number | computed
  # owner_id       = ""     # string | computed
  # version        = 0      # number | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_spot_price                                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_spot_price" "this" {

  availability_zone    = ""     # string | optional
  id                   = ""     # string | optional+computed
  instance_type        = ""     # string | optional

  # spot_price           = ""     # string | computed
  # spot_price_timestamp = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}


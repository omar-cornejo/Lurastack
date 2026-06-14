# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_instance_type_offering                          │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_instance_type_offering" "this" {

  id                       = ""     # string | optional+computed
  location_type            = ""     # string | optional
  preferred_instance_types = []     # list(string) | optional

  # instance_type            = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}


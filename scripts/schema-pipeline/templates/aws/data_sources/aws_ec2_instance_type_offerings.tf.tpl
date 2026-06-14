# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_instance_type_offerings                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_instance_type_offerings" "this" {

  id             = ""     # string | optional+computed
  location_type  = ""     # string | optional

  # instance_types = []     # list(string) | computed
  # location_types = []     # list(string) | computed
  # locations      = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}


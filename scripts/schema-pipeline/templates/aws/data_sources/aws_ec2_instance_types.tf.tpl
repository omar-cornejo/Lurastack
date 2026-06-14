# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_instance_types                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_instance_types" "this" {

  id             = ""     # string | optional+computed

  # instance_types = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}


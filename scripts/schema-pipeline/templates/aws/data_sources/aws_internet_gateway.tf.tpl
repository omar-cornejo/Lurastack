# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_internet_gateway                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_internet_gateway" "this" {

  id                  = ""     # string | optional+computed
  internet_gateway_id = ""     # string | optional+computed
  tags                = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed
  # attachments = [  # list(object)
  #   {
  #     state = ""
  #     vpc_id = ""
  #   }
  # ]
  # owner_id            = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}


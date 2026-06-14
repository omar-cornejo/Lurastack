# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_security_group                                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_security_group" "this" {

  id          = ""     # string | optional+computed
  name        = ""     # string | optional+computed
  tags        = {}     # map(string) | optional+computed
  vpc_id      = ""     # string | optional+computed

  # arn         = ""     # string | computed
  # description = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}


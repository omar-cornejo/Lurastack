# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_endpoint_policy                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_endpoint_policy" "this" {

  vpc_endpoint_id = ""     # string | required
  id              = ""     # string | optional+computed
  policy          = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}


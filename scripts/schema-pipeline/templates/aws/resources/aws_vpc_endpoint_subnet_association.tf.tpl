# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_endpoint_subnet_association                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_endpoint_subnet_association" "this" {

  subnet_id       = ""     # string | required
  vpc_endpoint_id = ""     # string | required
  id              = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}


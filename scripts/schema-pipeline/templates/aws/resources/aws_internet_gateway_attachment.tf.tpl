# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_internet_gateway_attachment                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_internet_gateway_attachment" "this" {

  internet_gateway_id = ""     # string | required
  vpc_id              = ""     # string | required
  id                  = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}


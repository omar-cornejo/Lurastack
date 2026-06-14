# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_connect_phone_number                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_connect_phone_number" "this" {

  country_code = ""     # string | required
  target_arn   = ""     # string | required
  type         = ""     # string | required
  description  = ""     # string | optional
  id           = ""     # string | optional+computed
  prefix       = ""     # string | optional
  tags         = {}     # map(string) | optional
  tags_all     = {}     # map(string) | optional+computed

  # arn          = ""     # string | computed
  # phone_number = ""     # string | computed
  # status = [  # list(object)
  #   {
  #     message = ""
  #     status = ""
  #   }
  # ]

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


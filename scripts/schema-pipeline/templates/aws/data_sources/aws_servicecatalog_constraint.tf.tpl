# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_servicecatalog_constraint                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_servicecatalog_constraint" "this" {

  id              = ""     # string | required
  accept_language = ""     # string | optional
  description     = ""     # string | optional+computed

  # owner           = ""     # string | computed
  # parameters      = ""     # string | computed
  # portfolio_id    = ""     # string | computed
  # product_id      = ""     # string | computed
  # status          = ""     # string | computed
  # type            = ""     # string | computed

  timeouts { # single
    read = ""     # string | optional

  }

}


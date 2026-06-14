# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_servicecatalog_constraint                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_servicecatalog_constraint" "this" {

  parameters      = ""     # string | required
  portfolio_id    = ""     # string | required
  product_id      = ""     # string | required
  type            = ""     # string | required
  accept_language = ""     # string | optional
  description     = ""     # string | optional+computed
  id              = ""     # string | optional+computed

  # owner           = ""     # string | computed
  # status          = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional
    update = ""     # string | optional

  }

}


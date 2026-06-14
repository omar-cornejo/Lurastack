# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_servicecatalog_product_portfolio_association    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_servicecatalog_product_portfolio_association" "this" {

  portfolio_id        = ""     # string | required
  product_id          = ""     # string | required
  accept_language     = ""     # string | optional
  id                  = ""     # string | optional+computed
  source_portfolio_id = ""     # string | optional

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional

  }

}


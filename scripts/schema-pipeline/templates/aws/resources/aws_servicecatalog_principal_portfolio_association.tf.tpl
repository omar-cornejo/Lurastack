# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_servicecatalog_principal_portfolio_association  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_servicecatalog_principal_portfolio_association" "this" {

  portfolio_id    = ""     # string | required
  principal_arn   = ""     # string | required
  accept_language = ""     # string | optional
  id              = ""     # string | optional+computed
  principal_type  = ""     # string | optional

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional

  }

}


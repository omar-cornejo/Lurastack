# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_servicecatalog_portfolio_share                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_servicecatalog_portfolio_share" "this" {

  portfolio_id        = ""     # string | required
  principal_id        = ""     # string | required
  type                = ""     # string | required
  accept_language     = ""     # string | optional
  id                  = ""     # string | optional+computed
  share_principals    = false  # bool | optional
  share_tag_options   = false  # bool | optional
  wait_for_acceptance = false  # bool | optional

  # accepted            = false  # bool | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional
    update = ""     # string | optional

  }

}


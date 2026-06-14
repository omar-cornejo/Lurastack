# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_servicecatalog_portfolio_constraints                │
# └──────────────────────────────────────────────────────────────┘
data "aws_servicecatalog_portfolio_constraints" "this" {

  portfolio_id    = ""     # string | required
  accept_language = ""     # string | optional
  id              = ""     # string | optional+computed
  product_id      = ""     # string | optional

  # details = [  # list(object)
  #   {
  #     constraint_id = ""
  #     description = ""
  #     owner = ""
  #     portfolio_id = ""
  #     product_id = ""
  #     type = ""
  #   }
  # ]

  timeouts { # single
    read = ""     # string | optional

  }

}


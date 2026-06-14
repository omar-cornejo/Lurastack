# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_servicecatalog_portfolio_status       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_servicecatalog_portfolio_status" "this" {

  status = ""     # string | required
  id     = ""     # string | optional+computed

}


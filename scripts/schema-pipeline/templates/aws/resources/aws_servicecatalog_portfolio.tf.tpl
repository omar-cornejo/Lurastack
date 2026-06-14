# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_servicecatalog_portfolio                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_servicecatalog_portfolio" "this" {

  name          = ""     # string | required
  provider_name = ""     # string | required
  description   = ""     # string | optional+computed
  id            = ""     # string | optional+computed
  tags          = {}     # map(string) | optional
  tags_all      = {}     # map(string) | optional+computed

  # arn           = ""     # string | computed
  # created_time  = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional
    update = ""     # string | optional

  }

}


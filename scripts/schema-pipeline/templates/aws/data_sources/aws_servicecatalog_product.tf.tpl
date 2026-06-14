# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_servicecatalog_product                              │
# └──────────────────────────────────────────────────────────────┘
data "aws_servicecatalog_product" "this" {

  id                  = ""     # string | required
  accept_language     = ""     # string | optional
  tags                = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed
  # created_time        = ""     # string | computed
  # description         = ""     # string | computed
  # distributor         = ""     # string | computed
  # has_default_path    = false  # bool | computed
  # name                = ""     # string | computed
  # owner               = ""     # string | computed
  # status              = ""     # string | computed
  # support_description = ""     # string | computed
  # support_email       = ""     # string | computed
  # support_url         = ""     # string | computed
  # type                = ""     # string | computed

  timeouts { # single
    read = ""     # string | optional

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_servicecatalog_portfolio                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_servicecatalog_portfolio" "this" {

  id              = ""     # string | required
  accept_language = ""     # string | optional
  tags            = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed
  # created_time    = ""     # string | computed
  # description     = ""     # string | computed
  # name            = ""     # string | computed
  # provider_name   = ""     # string | computed

  timeouts { # single
    read = ""     # string | optional

  }

}


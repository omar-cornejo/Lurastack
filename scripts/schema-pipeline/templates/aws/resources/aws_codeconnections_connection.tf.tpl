# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codeconnections_connection                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codeconnections_connection" "this" {

  name              = ""     # string | required
  host_arn          = ""     # string | optional
  provider_type     = ""     # string | optional+computed
  tags              = {}     # map(string) | optional

  # arn               = ""     # string | computed
  # connection_status = ""     # string | computed
  # id                = ""     # string | computed
  # owner_account_id  = ""     # string | computed
  # tags_all          = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}


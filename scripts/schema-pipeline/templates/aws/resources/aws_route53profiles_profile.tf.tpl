# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53profiles_profile                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53profiles_profile" "this" {

  name           = ""     # string | required
  tags           = {}     # map(string) | optional

  # arn            = ""     # string | computed
  # id             = ""     # string | computed
  # owner_id       = ""     # string | computed
  # share_status   = ""     # string | computed
  # status         = ""     # string | computed
  # status_message = ""     # string | computed
  # tags_all       = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    read   = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}


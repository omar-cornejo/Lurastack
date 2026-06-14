# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53profiles_association                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53profiles_association" "this" {

  name           = ""     # string | required
  profile_id     = ""     # string | required
  resource_id    = ""     # string | required
  tags           = {}     # map(string) | optional

  # arn            = ""     # string | computed
  # id             = ""     # string | computed
  # owner_id       = ""     # string | computed
  # status         = ""     # string | computed
  # status_message = ""     # string | computed
  # tags_all       = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53profiles_resource_association            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53profiles_resource_association" "this" {

  name                = ""     # string | required
  profile_id          = ""     # string | required
  resource_arn        = ""     # string | required
  resource_properties = ""     # string | optional

  # id                  = ""     # string | computed
  # owner_id            = ""     # string | computed
  # resource_type       = ""     # string | computed
  # status              = ""     # string | computed
  # status_message      = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    read   = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}


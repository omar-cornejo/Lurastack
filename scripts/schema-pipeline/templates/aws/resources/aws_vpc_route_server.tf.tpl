# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_route_server                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_route_server" "this" {

  amazon_side_asn           = 0      # number | required
  persist_routes            = ""     # string | optional+computed
  persist_routes_duration   = 0      # number | optional
  sns_notifications_enabled = false  # bool | optional+computed
  tags                      = {}     # map(string) | optional

  # arn                       = ""     # string | computed
  # route_server_id           = ""     # string | computed
  # sns_topic_arn             = ""     # string | computed
  # tags_all                  = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}


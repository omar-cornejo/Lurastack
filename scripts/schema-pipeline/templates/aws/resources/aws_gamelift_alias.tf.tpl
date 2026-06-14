# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_gamelift_alias                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_gamelift_alias" "this" {

  name        = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed

  routing_strategy { # list [1..1]
    type     = ""     # string | required
    fleet_id = ""     # string | optional
    message  = ""     # string | optional

  }

}


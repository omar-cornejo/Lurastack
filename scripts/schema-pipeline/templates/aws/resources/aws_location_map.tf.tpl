# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_location_map                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_location_map" "this" {

  map_name    = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # create_time = ""     # string | computed
  # map_arn     = ""     # string | computed
  # update_time = ""     # string | computed

  configuration { # list [1..1]
    style = ""     # string | required

  }

}


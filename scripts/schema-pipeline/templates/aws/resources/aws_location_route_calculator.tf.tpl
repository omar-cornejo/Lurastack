# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_location_route_calculator                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_location_route_calculator" "this" {

  calculator_name = ""     # string | required
  data_source     = ""     # string | required
  description     = ""     # string | optional
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed

  # calculator_arn  = ""     # string | computed
  # create_time     = ""     # string | computed
  # update_time     = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


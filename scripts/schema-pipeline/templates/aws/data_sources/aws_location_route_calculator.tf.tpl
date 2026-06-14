# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_location_route_calculator                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_location_route_calculator" "this" {

  calculator_name = ""     # string | required
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional+computed

  # calculator_arn  = ""     # string | computed
  # create_time     = ""     # string | computed
  # data_source     = ""     # string | computed
  # description     = ""     # string | computed
  # update_time     = ""     # string | computed

}


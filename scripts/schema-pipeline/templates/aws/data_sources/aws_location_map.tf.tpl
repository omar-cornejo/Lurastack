# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_location_map                                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_location_map" "this" {

  map_name      = ""     # string | required
  id            = ""     # string | optional+computed
  tags          = {}     # map(string) | optional+computed

  # configuration = [  # list(object)
  #   {
  #     style = ""
  #   }
  # ]
  # create_time   = ""     # string | computed
  # description   = ""     # string | computed
  # map_arn       = ""     # string | computed
  # update_time   = ""     # string | computed

}


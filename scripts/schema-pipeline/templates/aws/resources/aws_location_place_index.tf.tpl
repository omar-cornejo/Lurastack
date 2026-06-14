# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_location_place_index                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_location_place_index" "this" {

  data_source = ""     # string | required
  index_name  = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # create_time = ""     # string | computed
  # index_arn   = ""     # string | computed
  # update_time = ""     # string | computed

  data_source_configuration { # list [0..1]
    intended_use = ""     # string | optional

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_location_tracker_associations                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_location_tracker_associations" "this" {

  tracker_name  = ""     # string | required
  id            = ""     # string | optional+computed

  # consumer_arns = []     # set(string) | computed

}


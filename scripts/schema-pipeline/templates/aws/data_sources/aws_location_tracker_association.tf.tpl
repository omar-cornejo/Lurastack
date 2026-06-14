# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_location_tracker_association                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_location_tracker_association" "this" {

  consumer_arn = ""     # string | required
  tracker_name = ""     # string | required
  id           = ""     # string | optional+computed

}


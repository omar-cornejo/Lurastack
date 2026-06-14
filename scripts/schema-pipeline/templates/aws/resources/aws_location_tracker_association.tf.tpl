# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_location_tracker_association                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_location_tracker_association" "this" {

  consumer_arn = ""     # string | required
  tracker_name = ""     # string | required
  id           = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}


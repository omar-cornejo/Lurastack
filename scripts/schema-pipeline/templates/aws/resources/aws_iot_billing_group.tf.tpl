# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iot_billing_group                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iot_billing_group" "this" {

  name     = ""     # string | required
  tags     = {}     # map(string) | optional

  # arn      = ""     # string | computed
  # id       = ""     # string | computed
  # metadata = [  # list(object)
  #   {
  #     creation_date = ""
  #   }
  # ]
  # tags_all = {}     # map(string) | computed
  # version  = 0      # number | computed

  properties { # list
    description = ""     # string | optional

  }

}


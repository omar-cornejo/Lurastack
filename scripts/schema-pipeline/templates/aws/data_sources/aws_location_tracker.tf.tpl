# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_location_tracker                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_location_tracker" "this" {

  tracker_name       = ""     # string | required
  id                 = ""     # string | optional+computed
  tags               = {}     # map(string) | optional+computed

  # create_time        = ""     # string | computed
  # description        = ""     # string | computed
  # kms_key_id         = ""     # string | computed
  # position_filtering = ""     # string | computed
  # tracker_arn        = ""     # string | computed
  # update_time        = ""     # string | computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_location_tracker                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_location_tracker" "this" {

  tracker_name       = ""     # string | required
  description        = ""     # string | optional
  id                 = ""     # string | optional+computed
  kms_key_id         = ""     # string | optional
  position_filtering = ""     # string | optional
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # create_time        = ""     # string | computed
  # tracker_arn        = ""     # string | computed
  # update_time        = ""     # string | computed

}


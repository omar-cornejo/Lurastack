# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_guardduty_publishing_destination                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_guardduty_publishing_destination" "this" {

  destination_arn  = ""     # string | required
  detector_id      = ""     # string | required
  kms_key_arn      = ""     # string | required
  destination_type = ""     # string | optional
  id               = ""     # string | optional+computed

}


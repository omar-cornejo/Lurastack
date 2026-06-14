# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_guardduty_member_detector_feature               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_guardduty_member_detector_feature" "this" {

  account_id  = ""     # string | required
  detector_id = ""     # string | required
  name        = ""     # string | required
  status      = ""     # string | required

  additional_configuration { # list
    name   = ""     # string | required
    status = ""     # string | required

  }

}


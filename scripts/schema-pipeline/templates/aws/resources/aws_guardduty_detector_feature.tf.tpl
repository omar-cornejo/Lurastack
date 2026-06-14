# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_guardduty_detector_feature                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_guardduty_detector_feature" "this" {

  detector_id = ""     # string | required
  name        = ""     # string | required
  status      = ""     # string | required
  id          = ""     # string | optional+computed

  additional_configuration { # list
    name   = ""     # string | required
    status = ""     # string | required

  }

}


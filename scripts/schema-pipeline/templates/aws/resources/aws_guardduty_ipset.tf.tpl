# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_guardduty_ipset                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_guardduty_ipset" "this" {

  activate    = false  # bool | required
  detector_id = ""     # string | required
  format      = ""     # string | required
  location    = ""     # string | required
  name        = ""     # string | required
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed

}


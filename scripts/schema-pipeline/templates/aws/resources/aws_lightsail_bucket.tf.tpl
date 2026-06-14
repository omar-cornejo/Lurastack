# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lightsail_bucket                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lightsail_bucket" "this" {

  bundle_id         = ""     # string | required
  name              = ""     # string | required
  force_delete      = false  # bool | optional
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # availability_zone = ""     # string | computed
  # created_at        = ""     # string | computed
  # region            = ""     # string | computed
  # support_code      = ""     # string | computed
  # url               = ""     # string | computed

}


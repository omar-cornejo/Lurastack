# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lightsail_disk                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lightsail_disk" "this" {

  availability_zone = ""     # string | required
  name              = ""     # string | required
  size_in_gb        = 0      # number | required
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # created_at        = ""     # string | computed
  # support_code      = ""     # string | computed

}


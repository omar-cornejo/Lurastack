# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_transfer_profile                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_transfer_profile" "this" {

  as2_id          = ""     # string | required
  profile_type    = ""     # string | required
  certificate_ids = []     # set(string) | optional
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed
  # profile_id      = ""     # string | computed

}


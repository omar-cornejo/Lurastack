# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_media_packagev2_channel_group                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_media_packagev2_channel_group" "this" {

  name          = ""     # string | required
  description   = ""     # string | optional
  tags          = {}     # map(string) | optional

  # arn           = ""     # string | computed
  # egress_domain = ""     # string | computed
  # tags_all      = {}     # map(string) | computed

}


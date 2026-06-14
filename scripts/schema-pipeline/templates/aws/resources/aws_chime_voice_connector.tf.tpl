# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_chime_voice_connector                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_chime_voice_connector" "this" {

  name               = ""     # string | required
  require_encryption = false  # bool | required
  aws_region         = ""     # string | optional+computed
  id                 = ""     # string | optional+computed
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed
  # outbound_host_name = ""     # string | computed

}


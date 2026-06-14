# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_chime_voice_connector_origination               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_chime_voice_connector_origination" "this" {

  voice_connector_id = ""     # string | required
  disabled           = false  # bool | optional
  id                 = ""     # string | optional+computed

  route { # set [1..20]
    host     = ""     # string | required
    priority = 0      # number | required
    protocol = ""     # string | required
    weight   = 0      # number | required
    port     = 0      # number | optional

  }

}


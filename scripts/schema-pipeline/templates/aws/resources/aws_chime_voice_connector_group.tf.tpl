# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_chime_voice_connector_group                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_chime_voice_connector_group" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed

  connector { # set [0..3]
    priority           = 0      # number | required
    voice_connector_id = ""     # string | required

  }

}


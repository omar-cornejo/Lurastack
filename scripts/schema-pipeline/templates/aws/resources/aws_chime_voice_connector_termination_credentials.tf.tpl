# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_chime_voice_connector_termination_credentials   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_chime_voice_connector_termination_credentials" "this" {

  voice_connector_id = ""     # string | required
  id                 = ""     # string | optional+computed

  credentials { # set [1..10]
    password = ""     # string | required+sensitive
    username = ""     # string | required

  }

}


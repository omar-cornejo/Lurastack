# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_chime_voice_connector_streaming                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_chime_voice_connector_streaming" "this" {

  data_retention                 = 0      # number | required
  voice_connector_id             = ""     # string | required
  disabled                       = false  # bool | optional
  id                             = ""     # string | optional+computed
  streaming_notification_targets = []     # set(string) | optional

  media_insights_configuration { # list [0..1]
    configuration_arn = ""     # string | optional
    disabled          = false  # bool | optional

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_chime_voice_connector_logging                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_chime_voice_connector_logging" "this" {

  voice_connector_id       = ""     # string | required
  enable_media_metric_logs = false  # bool | optional
  enable_sip_logs          = false  # bool | optional
  id                       = ""     # string | optional+computed

}


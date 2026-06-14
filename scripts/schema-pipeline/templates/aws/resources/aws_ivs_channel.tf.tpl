# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ivs_channel                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ivs_channel" "this" {

  authorized                  = false  # bool | optional+computed
  id                          = ""     # string | optional+computed
  latency_mode                = ""     # string | optional+computed
  name                        = ""     # string | optional+computed
  recording_configuration_arn = ""     # string | optional+computed
  tags                        = {}     # map(string) | optional
  tags_all                    = {}     # map(string) | optional+computed
  type                        = ""     # string | optional+computed

  # arn                         = ""     # string | computed
  # ingest_endpoint             = ""     # string | computed
  # playback_url                = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


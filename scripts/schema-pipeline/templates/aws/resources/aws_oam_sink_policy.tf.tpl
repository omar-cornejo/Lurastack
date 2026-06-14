# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_oam_sink_policy                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_oam_sink_policy" "this" {

  policy          = ""     # string | required
  sink_identifier = ""     # string | required
  id              = ""     # string | optional+computed

  # arn             = ""     # string | computed
  # sink_id         = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


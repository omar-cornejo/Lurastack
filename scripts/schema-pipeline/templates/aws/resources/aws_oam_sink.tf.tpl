# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_oam_sink                                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_oam_sink" "this" {

  name     = ""     # string | required
  id       = ""     # string | optional+computed
  tags     = {}     # map(string) | optional
  tags_all = {}     # map(string) | optional+computed

  # arn      = ""     # string | computed
  # sink_id  = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


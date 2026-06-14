# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_oam_sink                                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_oam_sink" "this" {

  sink_identifier = ""     # string | required
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed
  # name            = ""     # string | computed
  # sink_id         = ""     # string | computed

}


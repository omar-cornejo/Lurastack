# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ivs_stream_key                                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_ivs_stream_key" "this" {

  channel_arn = ""     # string | required
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed
  # value       = ""     # string | computed

}


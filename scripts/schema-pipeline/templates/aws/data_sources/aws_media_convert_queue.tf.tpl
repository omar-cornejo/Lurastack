# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_media_convert_queue                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_media_convert_queue" "this" {

  id     = ""     # string | required
  tags   = {}     # map(string) | optional+computed

  # arn    = ""     # string | computed
  # name   = ""     # string | computed
  # status = ""     # string | computed

}


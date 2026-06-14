# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_media_store_container                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_media_store_container" "this" {

  name     = ""     # string | required
  id       = ""     # string | optional+computed
  tags     = {}     # map(string) | optional
  tags_all = {}     # map(string) | optional+computed

  # arn      = ""     # string | computed
  # endpoint = ""     # string | computed

}


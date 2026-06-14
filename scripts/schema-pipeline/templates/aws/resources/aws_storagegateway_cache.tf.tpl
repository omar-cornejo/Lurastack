# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_storagegateway_cache                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_storagegateway_cache" "this" {

  disk_id     = ""     # string | required
  gateway_arn = ""     # string | required
  id          = ""     # string | optional+computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_storagegateway_working_storage                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_storagegateway_working_storage" "this" {

  disk_id     = ""     # string | required
  gateway_arn = ""     # string | required
  id          = ""     # string | optional+computed

}


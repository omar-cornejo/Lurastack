# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_storagegateway_upload_buffer                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_storagegateway_upload_buffer" "this" {

  gateway_arn = ""     # string | required
  disk_id     = ""     # string | optional+computed
  disk_path   = ""     # string | optional+computed
  id          = ""     # string | optional+computed

}


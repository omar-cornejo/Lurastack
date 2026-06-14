# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_storagegateway_local_disk                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_storagegateway_local_disk" "this" {

  gateway_arn = ""     # string | required
  disk_node   = ""     # string | optional+computed
  disk_path   = ""     # string | optional+computed
  id          = ""     # string | optional+computed

  # disk_id     = ""     # string | computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_storagegateway_stored_iscsi_volume              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_storagegateway_stored_iscsi_volume" "this" {

  disk_id                  = ""     # string | required
  gateway_arn              = ""     # string | required
  network_interface_id     = ""     # string | required
  preserve_existing_data   = false  # bool | required
  target_name              = ""     # string | required
  id                       = ""     # string | optional+computed
  kms_encrypted            = false  # bool | optional
  kms_key                  = ""     # string | optional
  snapshot_id              = ""     # string | optional
  tags                     = {}     # map(string) | optional
  tags_all                 = {}     # map(string) | optional+computed

  # arn                      = ""     # string | computed
  # chap_enabled             = false  # bool | computed
  # lun_number               = 0      # number | computed
  # network_interface_port   = 0      # number | computed
  # target_arn               = ""     # string | computed
  # volume_attachment_status = ""     # string | computed
  # volume_id                = ""     # string | computed
  # volume_size_in_bytes     = 0      # number | computed
  # volume_status            = ""     # string | computed
  # volume_type              = ""     # string | computed

}


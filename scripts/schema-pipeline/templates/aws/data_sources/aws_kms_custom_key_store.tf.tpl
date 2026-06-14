# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_kms_custom_key_store                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_kms_custom_key_store" "this" {

  custom_key_store_id      = ""     # string | optional+computed
  custom_key_store_name    = ""     # string | optional+computed
  id                       = ""     # string | optional+computed

  # cloud_hsm_cluster_id     = ""     # string | computed
  # connection_state         = ""     # string | computed
  # creation_date            = ""     # string | computed
  # trust_anchor_certificate = ""     # string | computed

}


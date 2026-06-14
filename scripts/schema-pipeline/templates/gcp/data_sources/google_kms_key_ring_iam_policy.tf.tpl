# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_kms_key_ring_iam_policy                          │
# └──────────────────────────────────────────────────────────────┘
data "google_kms_key_ring_iam_policy" "this" {

  key_ring_id = ""     # string | required
  id          = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}


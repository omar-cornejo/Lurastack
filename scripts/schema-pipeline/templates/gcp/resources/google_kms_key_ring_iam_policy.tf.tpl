# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_kms_key_ring_iam_policy                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_kms_key_ring_iam_policy" "this" {

  key_ring_id = ""     # string | required
  policy_data = ""     # string | required
  id          = ""     # string | optional+computed

  # etag        = ""     # string | computed

}


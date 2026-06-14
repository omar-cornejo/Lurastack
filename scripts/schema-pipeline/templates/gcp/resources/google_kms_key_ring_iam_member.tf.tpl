# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_kms_key_ring_iam_member                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_kms_key_ring_iam_member" "this" {

  key_ring_id = ""     # string | required
  member      = ""     # string | required
  role        = ""     # string | required
  id          = ""     # string | optional+computed

  # etag        = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}


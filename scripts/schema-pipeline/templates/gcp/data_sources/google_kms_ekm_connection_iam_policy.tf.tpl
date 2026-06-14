# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_kms_ekm_connection_iam_policy                    │
# └──────────────────────────────────────────────────────────────┘
data "google_kms_ekm_connection_iam_policy" "this" {

  name        = ""     # string | required
  id          = ""     # string | optional+computed
  location    = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_data_fusion_instance_iam_policy                  │
# └──────────────────────────────────────────────────────────────┘
data "google_data_fusion_instance_iam_policy" "this" {

  name        = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed
  region      = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}


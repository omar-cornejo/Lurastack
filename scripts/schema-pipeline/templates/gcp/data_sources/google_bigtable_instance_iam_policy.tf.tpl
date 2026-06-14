# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_bigtable_instance_iam_policy                     │
# └──────────────────────────────────────────────────────────────┘
data "google_bigtable_instance_iam_policy" "this" {

  instance    = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}


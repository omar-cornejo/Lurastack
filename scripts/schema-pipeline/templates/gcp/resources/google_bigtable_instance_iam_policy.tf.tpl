# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_bigtable_instance_iam_policy                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_bigtable_instance_iam_policy" "this" {

  instance    = ""     # string | required
  policy_data = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}


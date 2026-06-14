# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_dataproc_cluster_iam_policy                      │
# └──────────────────────────────────────────────────────────────┘
data "google_dataproc_cluster_iam_policy" "this" {

  cluster     = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed
  region      = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}


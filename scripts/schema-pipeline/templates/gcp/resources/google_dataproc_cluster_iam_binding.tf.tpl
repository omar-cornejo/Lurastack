# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataproc_cluster_iam_binding                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataproc_cluster_iam_binding" "this" {

  cluster = ""     # string | required
  members = []     # set(string) | required
  role    = ""     # string | required
  id      = ""     # string | optional+computed
  project = ""     # string | optional+computed
  region  = ""     # string | optional+computed

  # etag    = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}


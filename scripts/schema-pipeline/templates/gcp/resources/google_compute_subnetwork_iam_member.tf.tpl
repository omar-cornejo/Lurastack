# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_subnetwork_iam_member                │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_subnetwork_iam_member" "this" {

  member     = ""     # string | required
  role       = ""     # string | required
  subnetwork = ""     # string | required
  id         = ""     # string | optional+computed
  project    = ""     # string | optional+computed
  region     = ""     # string | optional+computed

  # etag       = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}


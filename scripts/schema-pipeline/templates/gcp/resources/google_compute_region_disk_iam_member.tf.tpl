# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_region_disk_iam_member               │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_region_disk_iam_member" "this" {

  member  = ""     # string | required
  name    = ""     # string | required
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


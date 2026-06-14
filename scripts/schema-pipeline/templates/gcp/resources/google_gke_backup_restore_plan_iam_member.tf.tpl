# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_gke_backup_restore_plan_iam_member           │
# └──────────────────────────────────────────────────────────────┘
resource "google_gke_backup_restore_plan_iam_member" "this" {

  member   = ""     # string | required
  name     = ""     # string | required
  role     = ""     # string | required
  id       = ""     # string | optional+computed
  location = ""     # string | optional+computed
  project  = ""     # string | optional+computed

  # etag     = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}


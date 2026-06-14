# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_spanner_database_iam_binding                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_spanner_database_iam_binding" "this" {

  database = ""     # string | required
  instance = ""     # string | required
  members  = []     # set(string) | required
  role     = ""     # string | required
  id       = ""     # string | optional+computed
  project  = ""     # string | optional+computed

  # etag     = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}


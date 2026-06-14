# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataplex_task_iam_policy                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataplex_task_iam_policy" "this" {

  lake        = ""     # string | required
  policy_data = ""     # string | required
  task_id     = ""     # string | required
  id          = ""     # string | optional+computed
  location    = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}


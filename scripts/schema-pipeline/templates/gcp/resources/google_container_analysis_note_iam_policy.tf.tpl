# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_container_analysis_note_iam_policy           │
# └──────────────────────────────────────────────────────────────┘
resource "google_container_analysis_note_iam_policy" "this" {

  note        = ""     # string | required
  policy_data = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}


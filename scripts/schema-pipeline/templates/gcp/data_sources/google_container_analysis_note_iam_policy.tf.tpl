# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_container_analysis_note_iam_policy               │
# └──────────────────────────────────────────────────────────────┘
data "google_container_analysis_note_iam_policy" "this" {

  note        = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_secure_source_manager_repository_iam_policy      │
# └──────────────────────────────────────────────────────────────┘
data "google_secure_source_manager_repository_iam_policy" "this" {

  repository_id = ""     # string | required
  id            = ""     # string | optional+computed
  location      = ""     # string | optional+computed
  project       = ""     # string | optional+computed

  # etag          = ""     # string | computed
  # policy_data   = ""     # string | computed

}


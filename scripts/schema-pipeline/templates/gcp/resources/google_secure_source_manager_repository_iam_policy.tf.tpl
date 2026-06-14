# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_secure_source_manager_repository_iam_policy  │
# └──────────────────────────────────────────────────────────────┘
resource "google_secure_source_manager_repository_iam_policy" "this" {

  policy_data   = ""     # string | required
  repository_id = ""     # string | required
  id            = ""     # string | optional+computed
  location      = ""     # string | optional+computed
  project       = ""     # string | optional+computed

  # etag          = ""     # string | computed

}


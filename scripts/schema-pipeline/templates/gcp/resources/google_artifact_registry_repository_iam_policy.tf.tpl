# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_artifact_registry_repository_iam_policy      │
# └──────────────────────────────────────────────────────────────┘
resource "google_artifact_registry_repository_iam_policy" "this" {

  policy_data = ""     # string | required
  repository  = ""     # string | required
  id          = ""     # string | optional+computed
  location    = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}


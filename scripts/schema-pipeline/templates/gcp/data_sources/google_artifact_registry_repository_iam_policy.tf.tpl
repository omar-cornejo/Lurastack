# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_artifact_registry_repository_iam_policy          │
# └──────────────────────────────────────────────────────────────┘
data "google_artifact_registry_repository_iam_policy" "this" {

  repository  = ""     # string | required
  id          = ""     # string | optional+computed
  location    = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}


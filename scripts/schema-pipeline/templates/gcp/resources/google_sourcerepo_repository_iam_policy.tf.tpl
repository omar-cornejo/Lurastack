# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_sourcerepo_repository_iam_policy             │
# └──────────────────────────────────────────────────────────────┘
resource "google_sourcerepo_repository_iam_policy" "this" {

  policy_data = ""     # string | required
  repository  = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # etag        = ""     # string | computed

}


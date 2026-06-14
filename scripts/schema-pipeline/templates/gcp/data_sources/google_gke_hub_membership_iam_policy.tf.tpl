# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_gke_hub_membership_iam_policy                    │
# └──────────────────────────────────────────────────────────────┘
data "google_gke_hub_membership_iam_policy" "this" {

  membership_id = ""     # string | required
  id            = ""     # string | optional+computed
  location      = ""     # string | optional+computed
  project       = ""     # string | optional+computed

  # etag          = ""     # string | computed
  # policy_data   = ""     # string | computed

}


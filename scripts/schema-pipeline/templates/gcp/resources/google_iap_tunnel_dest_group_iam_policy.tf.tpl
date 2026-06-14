# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_iap_tunnel_dest_group_iam_policy             │
# └──────────────────────────────────────────────────────────────┘
resource "google_iap_tunnel_dest_group_iam_policy" "this" {

  dest_group  = ""     # string | required
  policy_data = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed
  region      = ""     # string | optional+computed

  # etag        = ""     # string | computed

}


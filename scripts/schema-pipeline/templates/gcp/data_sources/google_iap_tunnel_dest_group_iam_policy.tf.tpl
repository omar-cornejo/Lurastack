# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_iap_tunnel_dest_group_iam_policy                 │
# └──────────────────────────────────────────────────────────────┘
data "google_iap_tunnel_dest_group_iam_policy" "this" {

  dest_group  = ""     # string | required
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed
  region      = ""     # string | optional+computed

  # etag        = ""     # string | computed
  # policy_data = ""     # string | computed

}


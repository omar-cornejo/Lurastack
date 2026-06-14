# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_iap_tunnel_instance_iam_member               │
# └──────────────────────────────────────────────────────────────┘
resource "google_iap_tunnel_instance_iam_member" "this" {

  instance = ""     # string | required
  member   = ""     # string | required
  role     = ""     # string | required
  id       = ""     # string | optional+computed
  project  = ""     # string | optional+computed
  zone     = ""     # string | optional+computed

  # etag     = ""     # string | computed

  condition { # list [0..1]
    expression  = ""     # string | required
    title       = ""     # string | required
    description = ""     # string | optional

  }

}


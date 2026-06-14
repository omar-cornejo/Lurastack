# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_datastream_static_ips                            │
# └──────────────────────────────────────────────────────────────┘
data "google_datastream_static_ips" "this" {

  location   = ""     # string | required
  id         = ""     # string | optional+computed
  project    = ""     # string | optional

  # static_ips = []     # list(string) | computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_container_aws_versions                           │
# └──────────────────────────────────────────────────────────────┘
data "google_container_aws_versions" "this" {

  id                = ""     # string | optional+computed
  location          = ""     # string | optional
  project           = ""     # string | optional

  # supported_regions = []     # list(string) | computed
  # valid_versions    = []     # list(string) | computed

}


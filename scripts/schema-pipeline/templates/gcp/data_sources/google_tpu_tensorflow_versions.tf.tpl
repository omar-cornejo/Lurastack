# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_tpu_tensorflow_versions                          │
# └──────────────────────────────────────────────────────────────┘
data "google_tpu_tensorflow_versions" "this" {

  id       = ""     # string | optional+computed
  project  = ""     # string | optional+computed
  zone     = ""     # string | optional+computed

  # versions = []     # list(string) | computed

}


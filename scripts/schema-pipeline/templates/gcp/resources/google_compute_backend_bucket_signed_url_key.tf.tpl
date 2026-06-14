# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_backend_bucket_signed_url_key        │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_backend_bucket_signed_url_key" "this" {

  backend_bucket = ""     # string | required | The backend bucket this signed URL key belongs.
  key_value      = ""     # string | required+sensitive | 128-bit key value used for signing the URL. The key value mu…
  name           = ""     # string | required | Name of the signed URL key.
  id             = ""     # string | optional+computed
  project        = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}


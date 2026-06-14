# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_backend_service_signed_url_key       │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_backend_service_signed_url_key" "this" {

  backend_service = ""     # string | required | The backend service this signed URL key belongs.
  key_value       = ""     # string | required+sensitive | 128-bit key value used for signing the URL. The key value mu…
  name            = ""     # string | required | Name of the signed URL key.
  id              = ""     # string | optional+computed
  project         = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}


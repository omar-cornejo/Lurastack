# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_storage_object_signed_url                        │
# └──────────────────────────────────────────────────────────────┘
data "google_storage_object_signed_url" "this" {

  bucket            = ""     # string | required
  path              = ""     # string | required
  content_md5       = ""     # string | optional
  content_type      = ""     # string | optional
  credentials       = ""     # string | optional+sensitive
  duration          = ""     # string | optional
  extension_headers = {}     # map(string) | optional
  http_method       = ""     # string | optional
  id                = ""     # string | optional+computed

  # signed_url        = ""     # string | computed

}


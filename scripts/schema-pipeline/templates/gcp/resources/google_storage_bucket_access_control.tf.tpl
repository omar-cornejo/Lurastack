# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_storage_bucket_access_control                │
# └──────────────────────────────────────────────────────────────┘
resource "google_storage_bucket_access_control" "this" {

  bucket = ""     # string | required | The name of the bucket.
  entity = ""     # string | required | The entity holding the permission, in one of the following f…
  id     = ""     # string | optional+computed
  role   = ""     # string | optional | The access permission for the entity. Possible values: ["OWN…

  # domain = ""     # string | computed | The domain associated with the entity.
  # email  = ""     # string | computed | The email address associated with the entity.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


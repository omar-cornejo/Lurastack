# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_firestore_document                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_firestore_document" "this" {

  collection  = ""     # string | required | The collection ID, relative to database. For example: chatro…
  document_id = ""     # string | required | The client-assigned document ID to use for this document dur…
  fields      = ""     # string | required | The document's [fields](https://cloud.google.com/firestore/d…
  database    = ""     # string | optional | The Firestore database id. Defaults to '"(default)"'.
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  # create_time = ""     # string | computed | Creation timestamp in RFC3339 format.
  # name        = ""     # string | computed | A server defined name for this document. Format: 'projects/{…
  # path        = ""     # string | computed | A relative path to the collection this document exists withi…
  # update_time = ""     # string | computed | Last update timestamp in RFC3339 format.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


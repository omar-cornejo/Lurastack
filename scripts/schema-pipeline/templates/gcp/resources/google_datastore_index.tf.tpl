# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_datastore_index                              │
# └──────────────────────────────────────────────────────────────┘
# ⚠ DEPRECATED: this resource type is deprecated
resource "google_datastore_index" "this" {

  kind     = ""     # string | required | The entity kind which the index applies to.
  ancestor = ""     # string | optional | Policy for including ancestors in the index. Default value: …
  id       = ""     # string | optional+computed
  project  = ""     # string | optional+computed

  # index_id = ""     # string | computed | The index id.

  properties { # list
    direction = ""     # string | required | The direction the index should optimize for sorting. Possibl…
    name      = ""     # string | required | The property name to index.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}


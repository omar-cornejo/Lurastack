# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_discovery_engine_schema                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_discovery_engine_schema" "this" {

  data_store_id = ""     # string | required | The unique id of the data store.
  location      = ""     # string | required | The geographic location where the data store should reside. …
  schema_id     = ""     # string | required | The unique id of the schema.
  id            = ""     # string | optional+computed
  json_schema   = ""     # string | optional | The JSON representation of the schema.
  project       = ""     # string | optional+computed

  # name          = ""     # string | computed | The unique full resource name of the schema. Values are of t…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}


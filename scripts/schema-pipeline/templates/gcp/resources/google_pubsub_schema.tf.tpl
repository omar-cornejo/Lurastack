# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_pubsub_schema                                │
# └──────────────────────────────────────────────────────────────┘
resource "google_pubsub_schema" "this" {

  name       = ""     # string | required | The ID to use for the schema, which will become the final co…
  definition = ""     # string | optional | The definition of the schema. This should contain a string r…
  id         = ""     # string | optional+computed
  project    = ""     # string | optional+computed
  type       = ""     # string | optional | The type of the schema definition Default value: "TYPE_UNSPE…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


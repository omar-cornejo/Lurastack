# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_firestore_index                              │
# └──────────────────────────────────────────────────────────────┘
resource "google_firestore_index" "this" {

  collection  = ""     # string | required | The collection being indexed.
  api_scope   = ""     # string | optional | The API scope at which a query is run. Default value: "ANY_A…
  database    = ""     # string | optional | The Firestore database id. Defaults to '"(default)"'.
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed
  query_scope = ""     # string | optional | The scope at which a query is run. Default value: "COLLECTIO…

  # name        = ""     # string | computed | A server defined name for this index. Format: 'projects/{{pr…

  fields { # list [2..*]
    array_config = ""     # string | optional | Indicates that this field supports operations on arrayValues…
    field_path   = ""     # string | optional | Name of the field.
    order        = ""     # string | optional | Indicates that this field supports ordering by the specified…

    vector_config { # list [0..1]
      dimension = 0      # number | optional | The resulting index will only include vectors of this dimens…

      flat {} # list [0..1]

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_firestore_field                              │
# └──────────────────────────────────────────────────────────────┘
resource "google_firestore_field" "this" {

  collection = ""     # string | required | The id of the collection group to configure.
  field      = ""     # string | required | The id of the field to configure.
  database   = ""     # string | optional | The Firestore database id. Defaults to '"(default)"'.
  id         = ""     # string | optional+computed
  project    = ""     # string | optional+computed

  # name       = ""     # string | computed | The name of this field. Format: 'projects/{{project}}/databa…

  index_config { # list [0..1]

    indexes { # set
      array_config = ""     # string | optional | Indicates that this field supports operations on arrayValues…
      order        = ""     # string | optional | Indicates that this field supports ordering by the specified…
      query_scope  = ""     # string | optional | The scope at which a query is run. Collection scoped queries…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  ttl_config { # list [0..1]

    # state = ""     # string | computed | The state of TTL (time-to-live) configuration for documents …

  }

}


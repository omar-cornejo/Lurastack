# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_discovery_engine_search_engine               │
# └──────────────────────────────────────────────────────────────┘
resource "google_discovery_engine_search_engine" "this" {

  collection_id     = ""     # string | required | The collection ID.
  data_store_ids    = []     # list(string) | required | The data stores associated with this engine. For SOLUTION_TY…
  display_name      = ""     # string | required | Required. The display name of the engine. Should be human re…
  engine_id         = ""     # string | required | Unique ID to use for Search Engine App.
  location          = ""     # string | required | Location.
  id                = ""     # string | optional+computed
  industry_vertical = ""     # string | optional | The industry vertical that the engine registers. The restric…
  project           = ""     # string | optional+computed

  # create_time       = ""     # string | computed | Timestamp the Engine was created at.
  # name              = ""     # string | computed | The unique full resource name of the search engine. Values a…
  # update_time       = ""     # string | computed | Timestamp the Engine was last updated.

  common_config { # list [0..1]
    company_name = ""     # string | optional | The name of the company, business or entity that is associat…

  }

  search_engine_config { # list [1..1]
    search_add_ons = []     # list(string) | optional | The add-on that this search engine enables. Possible values:…
    search_tier    = ""     # string | optional | The search feature tier of this engine. Defaults to SearchTi…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


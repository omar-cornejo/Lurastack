# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dialogflow_entity_type                       │
# └──────────────────────────────────────────────────────────────┘
resource "google_dialogflow_entity_type" "this" {

  display_name            = ""     # string | required | The name of this entity type to be displayed on the console.
  kind                    = ""     # string | required | Indicates the kind of entity type. * KIND_MAP: Map entity ty…
  enable_fuzzy_extraction = false  # bool | optional | Enables fuzzy entity extraction during classification.
  id                      = ""     # string | optional+computed
  project                 = ""     # string | optional+computed

  # name                    = ""     # string | computed | The unique identifier of the entity type. Format: projects/<…

  entities { # list
    synonyms = []     # list(string) | required | A collection of value synonyms. For example, if the entity t…
    value    = ""     # string | required | The primary value associated with this entity entry. For exa…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


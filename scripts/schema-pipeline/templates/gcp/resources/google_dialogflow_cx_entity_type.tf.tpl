# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dialogflow_cx_entity_type                    │
# └──────────────────────────────────────────────────────────────┘
resource "google_dialogflow_cx_entity_type" "this" {

  display_name            = ""     # string | required | The human-readable name of the entity type, unique within th…
  kind                    = ""     # string | required | Indicates whether the entity type can be automatically expan…
  auto_expansion_mode     = ""     # string | optional | Represents kinds of entities. * AUTO_EXPANSION_MODE_UNSPECIF…
  enable_fuzzy_extraction = false  # bool | optional | Enables fuzzy entity extraction during classification.
  id                      = ""     # string | optional+computed
  language_code           = ""     # string | optional | The language of the following fields in entityType: EntityTy…
  parent                  = ""     # string | optional | The agent to create a entity type for. Format: projects/<Pro…
  redact                  = false  # bool | optional | Indicates whether parameters of the entity type should be re…

  # name                    = ""     # string | computed | The unique identifier of the entity type. Format: projects/<…

  entities { # list [1..*]
    synonyms = []     # list(string) | optional | A collection of value synonyms. For example, if the entity t…
    value    = ""     # string | optional | The primary value associated with this entity entry. For exa…

  }

  excluded_phrases { # list
    value = ""     # string | optional | The word or phrase to be excluded.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


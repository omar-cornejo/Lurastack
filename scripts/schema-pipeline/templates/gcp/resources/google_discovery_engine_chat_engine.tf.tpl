# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_discovery_engine_chat_engine                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_discovery_engine_chat_engine" "this" {

  collection_id        = ""     # string | required | The collection ID.
  data_store_ids       = []     # list(string) | required | The data stores associated with this engine. Multiple DataSt…
  display_name         = ""     # string | required | The display name of the engine. Should be human readable. UT…
  engine_id            = ""     # string | required | The ID to use for chat engine.
  location             = ""     # string | required | Location.
  id                   = ""     # string | optional+computed
  industry_vertical    = ""     # string | optional | The industry vertical that the chat engine registers. Vertic…
  project              = ""     # string | optional+computed

  # chat_engine_metadata = [  # list(object)
  #   {
  #     dialogflow_agent = ""
  #   }
  # ]
  # create_time          = ""     # string | computed | Timestamp the Engine was created at.
  # name                 = ""     # string | computed | The unique full resource name of the chat engine. Values are…
  # update_time          = ""     # string | computed | Timestamp the Engine was last updated.

  chat_engine_config { # list [1..1]

    agent_creation_config { # list [1..1]
      default_language_code = ""     # string | required | The default language of the agent as a language tag. See [La…
      time_zone             = ""     # string | required | The time zone of the agent from the [time zone database](htt…
      business              = ""     # string | optional | Name of the company, organization or other entity that the a…
      location              = ""     # string | optional | Agent location for Agent creation, currently supported value…

    }

  }

  common_config { # list [0..1]
    company_name = ""     # string | optional | The name of the company, business or entity that is associat…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


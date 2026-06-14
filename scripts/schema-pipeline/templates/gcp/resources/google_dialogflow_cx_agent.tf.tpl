# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dialogflow_cx_agent                          │
# └──────────────────────────────────────────────────────────────┘
resource "google_dialogflow_cx_agent" "this" {

  default_language_code      = ""     # string | required | The default language of the agent as a language tag. [See La…
  display_name               = ""     # string | required | The human-readable name of the agent, unique within the loca…
  location                   = ""     # string | required | The name of the location this agent is located in.  ~> **Not…
  time_zone                  = ""     # string | required | The time zone of this agent from the [time zone database](ht…
  avatar_uri                 = ""     # string | optional | The URI of the agent's avatar. Avatars are used throughout t…
  description                = ""     # string | optional | The description of this agent. The maximum length is 500 cha…
  enable_spell_correction    = false  # bool | optional | Indicates if automatic spell correction is enabled in detect…
  enable_stackdriver_logging = false  # bool | optional | Determines whether this agent should log conversation querie…
  id                         = ""     # string | optional+computed
  project                    = ""     # string | optional+computed
  security_settings          = ""     # string | optional | Name of the SecuritySettings reference for the agent. Format…
  supported_language_codes   = []     # list(string) | optional | The list of all languages supported by this agent (except fo…

  # name                       = ""     # string | computed | The unique identifier of the agent.
  # start_flow                 = ""     # string | computed | Name of the start flow in this agent. A start flow will be a…

  advanced_settings { # list [0..1]

    audio_export_gcs_destination { # list [0..1]
      uri = ""     # string | optional | The Google Cloud Storage URI for the exported objects. Wheth…

    }

    dtmf_settings { # list [0..1]
      enabled      = false  # bool | optional | If true, incoming audio is processed for DTMF (dual tone mul…
      finish_digit = ""     # string | optional | The digit that terminates a DTMF digit sequence.
      max_digits   = 0      # number | optional | Max length of DTMF digits.

    }

  }

  git_integration_settings { # list [0..1]

    github_settings { # list [0..1]
      access_token    = ""     # string | optional+sensitive | The access token used to authenticate the access to the GitH…
      branches        = []     # list(string) | optional | A list of branches configured to be used from Dialogflow.
      display_name    = ""     # string | optional | The unique repository display name for the GitHub repository…
      repository_uri  = ""     # string | optional | The GitHub repository URI related to the agent.
      tracking_branch = ""     # string | optional | The branch of the GitHub repository tracked for this agent.

    }

  }

  speech_to_text_settings { # list [0..1]
    enable_speech_adaptation = false  # bool | optional | Whether to use speech adaptation for speech recognition.

  }

  text_to_speech_settings { # list [0..1]
    synthesize_speech_configs = ""     # string | optional | Configuration of how speech should be synthesized, mapping f…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


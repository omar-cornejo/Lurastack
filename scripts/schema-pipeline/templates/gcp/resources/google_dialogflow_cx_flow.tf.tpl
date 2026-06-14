# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dialogflow_cx_flow                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_dialogflow_cx_flow" "this" {

  display_name            = ""     # string | required | The human-readable name of the flow.
  description             = ""     # string | optional | The description of the flow. The maximum length is 500 chara…
  id                      = ""     # string | optional+computed
  is_default_start_flow   = false  # bool | optional | Marks this as the [Default Start Flow](https://cloud.google.…
  language_code           = ""     # string | optional | The language of the following fields in flow: Flow.event_han…
  parent                  = ""     # string | optional | The agent to create a flow for. Format: projects/<Project ID…
  transition_route_groups = []     # list(string) | optional | A flow's transition route group serve two purposes: They are…

  # name                    = ""     # string | computed | The unique identifier of the flow. Format: projects/<Project…

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

  event_handlers { # list
    event       = ""     # string | optional | The name of the event to handle.
    target_flow = ""     # string | optional | The target flow to transition to. Format: projects/<Project …
    target_page = ""     # string | optional | The target page to transition to. Format: projects/<Project …

    # name        = ""     # string | computed | The unique identifier of this event handler.

    trigger_fulfillment { # list [0..1]
      return_partial_responses = false  # bool | optional | Whether Dialogflow should return currently queued fulfillmen…
      tag                      = ""     # string | optional | The tag used by the webhook to identify which fulfillment is…
      webhook                  = ""     # string | optional | The webhook to call. Format: projects/<Project ID>/locations…

      conditional_cases { # list
        cases = ""     # string | optional | A JSON encoded list of cascading if-else conditions. Cases a…

      }

      messages { # list
        channel = ""     # string | optional | The channel which the response is associated with. Clients c…
        payload = ""     # string | optional | A custom, platform-specific payload.

        conversation_success { # list [0..1]
          metadata = ""     # string | optional | Custom metadata. Dialogflow doesn't impose any structure on …

        }

        live_agent_handoff { # list [0..1]
          metadata = ""     # string | optional | Custom metadata. Dialogflow doesn't impose any structure on …

        }

        output_audio_text { # list [0..1]
          ssml                        = ""     # string | optional | The SSML text to be synthesized. For more information, see S…
          text                        = ""     # string | optional | The raw text to be synthesized.

          # allow_playback_interruption = false  # bool | computed | Whether the playback of this message can be interrupted by t…

        }

        play_audio { # list [0..1]
          audio_uri                   = ""     # string | required | URI of the audio clip. Dialogflow does not impose any valida…

          # allow_playback_interruption = false  # bool | computed | Whether the playback of this message can be interrupted by t…

        }

        telephony_transfer_call { # list [0..1]
          phone_number = ""     # string | required | Transfer the call to a phone number in E.164 format.

        }

        text { # list [0..1]
          text                        = []     # list(string) | optional | A collection of text responses.

          # allow_playback_interruption = false  # bool | computed | Whether the playback of this message can be interrupted by t…

        }

      }

      set_parameter_actions { # list
        parameter = ""     # string | optional | Display name of the parameter.
        value     = ""     # string | optional | The new JSON-encoded value of the parameter. A null value cl…

      }

    }

  }

  nlu_settings { # list [0..1]
    classification_threshold = 0      # number | optional | To filter out false positive results and still get variety i…
    model_training_mode      = ""     # string | optional | Indicates NLU model training mode. * MODEL_TRAINING_MODE_AUT…
    model_type               = ""     # string | optional | Indicates the type of NLU model. * MODEL_TYPE_STANDARD: Use …

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  transition_routes { # list
    condition   = ""     # string | optional | The condition to evaluate against form parameters or session…
    intent      = ""     # string | optional | The unique identifier of an Intent. Format: projects/<Projec…
    target_flow = ""     # string | optional | The target flow to transition to. Format: projects/<Project …
    target_page = ""     # string | optional | The target page to transition to. Format: projects/<Project …

    # name        = ""     # string | computed | The unique identifier of this transition route.

    trigger_fulfillment { # list [0..1]
      return_partial_responses = false  # bool | optional | Whether Dialogflow should return currently queued fulfillmen…
      tag                      = ""     # string | optional | The tag used by the webhook to identify which fulfillment is…
      webhook                  = ""     # string | optional | The webhook to call. Format: projects/<Project ID>/locations…

      conditional_cases { # list
        cases = ""     # string | optional | A JSON encoded list of cascading if-else conditions. Cases a…

      }

      messages { # list
        channel = ""     # string | optional | The channel which the response is associated with. Clients c…
        payload = ""     # string | optional | A custom, platform-specific payload.

        conversation_success { # list [0..1]
          metadata = ""     # string | optional | Custom metadata. Dialogflow doesn't impose any structure on …

        }

        live_agent_handoff { # list [0..1]
          metadata = ""     # string | optional | Custom metadata. Dialogflow doesn't impose any structure on …

        }

        output_audio_text { # list [0..1]
          ssml                        = ""     # string | optional | The SSML text to be synthesized. For more information, see S…
          text                        = ""     # string | optional | The raw text to be synthesized.

          # allow_playback_interruption = false  # bool | computed | Whether the playback of this message can be interrupted by t…

        }

        play_audio { # list [0..1]
          audio_uri                   = ""     # string | required | URI of the audio clip. Dialogflow does not impose any valida…

          # allow_playback_interruption = false  # bool | computed | Whether the playback of this message can be interrupted by t…

        }

        telephony_transfer_call { # list [0..1]
          phone_number = ""     # string | required | Transfer the call to a phone number in E.164 format.

        }

        text { # list [0..1]
          text                        = []     # list(string) | optional | A collection of text responses.

          # allow_playback_interruption = false  # bool | computed | Whether the playback of this message can be interrupted by t…

        }

      }

      set_parameter_actions { # list
        parameter = ""     # string | optional | Display name of the parameter.
        value     = ""     # string | optional | The new JSON-encoded value of the parameter. A null value cl…

      }

    }

  }

}


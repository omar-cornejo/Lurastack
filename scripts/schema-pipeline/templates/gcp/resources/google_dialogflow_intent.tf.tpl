# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dialogflow_intent                            │
# └──────────────────────────────────────────────────────────────┘
resource "google_dialogflow_intent" "this" {

  display_name                = ""     # string | required | The name of this intent to be displayed on the console.
  action                      = ""     # string | optional+computed | The name of the action associated with the intent. Note: The…
  default_response_platforms  = []     # list(string) | optional | The list of platforms for which the first responses will be …
  events                      = []     # list(string) | optional | The collection of event names that trigger the intent. If th…
  id                          = ""     # string | optional+computed
  input_context_names         = []     # list(string) | optional | The list of context names required for this intent to be tri…
  is_fallback                 = false  # bool | optional+computed | Indicates whether this is a fallback intent.
  ml_disabled                 = false  # bool | optional+computed | Indicates whether Machine Learning is disabled for the inten…
  parent_followup_intent_name = ""     # string | optional+computed | The unique identifier of the parent intent in the chain of f…
  priority                    = 0      # number | optional+computed | The priority of this intent. Higher numbers represent higher…
  project                     = ""     # string | optional+computed
  reset_contexts              = false  # bool | optional+computed | Indicates whether to delete all contexts in the current sess…
  webhook_state               = ""     # string | optional+computed | Indicates whether webhooks are enabled for the intent. * WEB…

  # followup_intent_info = [  # list(object)
  #   {
  #     followup_intent_name = ""
  #     parent_followup_intent_name = ""
  #   }
  # ]
  # name                        = ""     # string | computed | The unique identifier of this intent. Format: projects/<Proj…
  # root_followup_intent_name   = ""     # string | computed | The unique identifier of the root intent in the chain of fol…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


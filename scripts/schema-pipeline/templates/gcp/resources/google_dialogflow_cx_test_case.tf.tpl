# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dialogflow_cx_test_case                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_dialogflow_cx_test_case" "this" {

  display_name     = ""     # string | required | The human-readable name of the test case, unique within the …
  id               = ""     # string | optional+computed
  notes            = ""     # string | optional | Additional freeform notes about the test case. Limit of 400 …
  parent           = ""     # string | optional | The agent to create the test case for. Format: projects/<Pro…
  tags             = []     # list(string) | optional | Tags are short descriptions that users may apply to test cas…

  # creation_time    = ""     # string | computed | When the test was created. A timestamp in RFC3339 text forma…
  # last_test_result = [  # list(object)
  #   {
  #     conversation_turns = [  # list(object)
  #       {
  #         user_input = [  # list(object)
  #           {
  #             enable_sentiment_analysis = false
  #             injected_parameters = ""
  #             input = [  # list(object)
  #               {
  #                 dtmf = [  # list(object)
  #                   {
  #                     digits = ""
  #                     finish_digit = ""
  #                   }
  #                 ]
  #                 event = [  # list(object)
  #                   {
  #                     event = ""
  #                   }
  #                 ]
  #                 language_code = ""
  #                 text = [  # list(object)
  #                   {
  #                     text = ""
  #                   }
  #                 ]
  #               }
  #             ]
  #             is_webhook_enabled = false
  #           }
  #         ]
  #         virtual_agent_output = [  # list(object)
  #           {
  #             current_page = [  # list(object)
  #               {
  #                 display_name = ""
  #                 name = ""
  #               }
  #             ]
  #             differences = [  # list(object)
  #               {
  #                 description = ""
  #                 type = ""
  #               }
  #             ]
  #             session_parameters = ""
  #             status = [  # list(object)
  #               {
  #                 code = 0
  #                 details = ""
  #                 message = ""
  #               }
  #             ]
  #             text_responses = [  # list(object)
  #               {
  #                 text = []  # list(string)
  #               }
  #             ]
  #             triggered_intent = [  # list(object)
  #               {
  #                 display_name = ""
  #                 name = ""
  #               }
  #             ]
  #           }
  #         ]
  #       }
  #     ]
  #     environment = ""
  #     name = ""
  #     test_result = ""
  #     test_time = ""
  #   }
  # ]
  # name             = ""     # string | computed | The unique identifier of the test case. Format: projects/<Pr…

  test_case_conversation_turns { # list

    user_input { # list [0..1]
      enable_sentiment_analysis = false  # bool | optional | Whether sentiment analysis is enabled.
      injected_parameters       = ""     # string | optional | Parameters that need to be injected into the conversation du…
      is_webhook_enabled        = false  # bool | optional | If webhooks should be allowed to trigger in response to the …

      input { # list [0..1]
        language_code = ""     # string | optional | The language of the input. See [Language Support](https://cl…

        dtmf { # list [0..1]
          digits       = ""     # string | optional | The dtmf digits.
          finish_digit = ""     # string | optional | The finish digit (if any).

        }

        event { # list [0..1]
          event = ""     # string | required | Name of the event.

        }

        text { # list [0..1]
          text = ""     # string | required | The natural language text to be processed. Text length must …

        }

      }

    }

    virtual_agent_output { # list [0..1]
      session_parameters = ""     # string | optional | The session parameters available to the bot at this point.

      current_page { # list [0..1]
        name         = ""     # string | optional | The unique identifier of the page. Format: projects/<Project…

        # display_name = ""     # string | computed | The human-readable name of the page, unique within the flow.

      }

      text_responses { # list
        text = []     # list(string) | optional | A collection of text responses.

      }

      triggered_intent { # list [0..1]
        name         = ""     # string | optional | The unique identifier of the intent. Format: projects/<Proje…

        # display_name = ""     # string | computed | The human-readable name of the intent, unique within the age…

      }

    }

  }

  test_config { # list [0..1]
    flow                = ""     # string | optional | Flow name to start the test case with. Format: projects/<Pro…
    page                = ""     # string | optional | The page to start the test case with. Format: projects/<Proj…
    tracking_parameters = []     # list(string) | optional | Session parameters to be compared when calculating differenc…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


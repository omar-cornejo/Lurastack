# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_bedrockagent_prompt                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_bedrockagent_prompt" "this" {

  name                        = ""     # string | required
  customer_encryption_key_arn = ""     # string | optional
  default_variant             = ""     # string | optional
  description                 = ""     # string | optional
  tags                        = {}     # map(string) | optional

  # arn                         = ""     # string | computed
  # created_at                  = ""     # string | computed
  # id                          = ""     # string | computed
  # tags_all                    = {}     # map(string) | computed
  # updated_at                  = ""     # string | computed
  # version                     = ""     # string | computed

  variant { # list
    name                            = ""     # string | required
    template_type                   = ""     # string | required
    additional_model_request_fields = ""     # string | optional
    model_id                        = ""     # string | optional

    gen_ai_resource { # list

      agent { # list
        agent_identifier = ""     # string | required

      }

    }

    inference_configuration { # list

      text { # list
        max_tokens     = 0      # number | optional
        stop_sequences = []     # list(string) | optional
        temperature    = 0      # number | optional
        top_p          = 0      # number | optional

      }

    }

    metadata { # list
      key   = ""     # string | required
      value = ""     # string | required

    }

    template_configuration { # list

      chat { # list

        input_variable { # list
          name = ""     # string | required

        }

        message { # list
          role = ""     # string | required

          content { # list
            text = ""     # string | optional

            cache_point { # list
              type = ""     # string | required

            }

          }

        }

        system { # list
          text = ""     # string | optional

          cache_point { # list
            type = ""     # string | required

          }

        }

        tool_configuration { # list

          tool { # list

            cache_point { # list
              type = ""     # string | required

            }

            tool_spec { # list
              name        = ""     # string | required
              description = ""     # string | optional

              input_schema { # list
                json = ""     # string | optional

              }

            }

          }

          tool_choice { # list

            any {} # list

            auto {} # list

            tool { # list
              name = ""     # string | required

            }

          }

        }

      }

      text { # list
        text = ""     # string | required

        cache_point { # list
          type = ""     # string | required

        }

        input_variable { # list
          name = ""     # string | required

        }

      }

    }

  }

}


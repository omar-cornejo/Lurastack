# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lexv2models_slot                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lexv2models_slot" "this" {

  bot_id       = ""     # string | required
  bot_version  = ""     # string | required
  intent_id    = ""     # string | required
  locale_id    = ""     # string | required
  name         = ""     # string | required
  description  = ""     # string | optional
  slot_type_id = ""     # string | optional+computed

  # id           = ""     # string | computed
  # slot_id      = ""     # string | computed

  multiple_values_setting { # list
    allow_multiple_values = false  # bool | optional

  }

  obfuscation_setting { # list
    obfuscation_setting_type = ""     # string | required

  }

  sub_slot_setting { # list
    expression = ""     # string | optional

    slot_specification { # set
      map_block_key = ""     # string | required
      slot_type_id  = ""     # string | required

      value_elicitation_setting { # list

        default_value_specification { # list

          default_value_list { # list
            default_value = ""     # string | required

          }

        }

        prompt_specification { # list
          max_retries                = 0      # number | required
          allow_interrupt            = false  # bool | optional
          message_selection_strategy = ""     # string | optional

          message_group { # list

            message { # list

              custom_payload { # list
                value = ""     # string | required

              }

              image_response_card { # list
                title     = ""     # string | required
                image_url = ""     # string | optional
                subtitle  = ""     # string | optional

                button { # list
                  text  = ""     # string | required
                  value = ""     # string | required

                }

              }

              plain_text_message { # list
                value = ""     # string | required

              }

              ssml_message { # list
                value = ""     # string | required

              }

            }

            variation { # list

              custom_payload { # list
                value = ""     # string | required

              }

              image_response_card { # list
                title     = ""     # string | required
                image_url = ""     # string | optional
                subtitle  = ""     # string | optional

                button { # list
                  text  = ""     # string | required
                  value = ""     # string | required

                }

              }

              plain_text_message { # list
                value = ""     # string | required

              }

              ssml_message { # list
                value = ""     # string | required

              }

            }

          }

          prompt_attempts_specification { # set
            map_block_key   = ""     # string | required
            allow_interrupt = false  # bool | optional

            allowed_input_types { # list
              allow_audio_input = false  # bool | required
              allow_dtmf_input  = false  # bool | required

            }

            audio_and_dtmf_input_specification { # list
              start_timeout_ms = 0      # number | required

              audio_specification { # list
                end_timeout_ms = 0      # number | required
                max_length_ms  = 0      # number | required

              }

              dtmf_specification { # list
                deletion_character = ""     # string | required
                end_character      = ""     # string | required
                end_timeout_ms     = 0      # number | required
                max_length         = 0      # number | required

              }

            }

            text_input_specification { # list
              start_timeout_ms = 0      # number | required

            }

          }

        }

        sample_utterance { # list
          utterance = ""     # string | required

        }

        wait_and_continue_specification { # list
          active = false  # bool | optional

          continue_response { # list
            allow_interrupt = false  # bool | optional

            message_group { # list

              message { # list

                custom_payload { # list
                  value = ""     # string | required

                }

                image_response_card { # list
                  title     = ""     # string | required
                  image_url = ""     # string | optional
                  subtitle  = ""     # string | optional

                  button { # list
                    text  = ""     # string | required
                    value = ""     # string | required

                  }

                }

                plain_text_message { # list
                  value = ""     # string | required

                }

                ssml_message { # list
                  value = ""     # string | required

                }

              }

              variation { # list

                custom_payload { # list
                  value = ""     # string | required

                }

                image_response_card { # list
                  title     = ""     # string | required
                  image_url = ""     # string | optional
                  subtitle  = ""     # string | optional

                  button { # list
                    text  = ""     # string | required
                    value = ""     # string | required

                  }

                }

                plain_text_message { # list
                  value = ""     # string | required

                }

                ssml_message { # list
                  value = ""     # string | required

                }

              }

            }

          }

          still_waiting_response { # list
            frequency_in_seconds = 0      # number | required
            timeout_in_seconds   = 0      # number | required
            allow_interrupt      = false  # bool | optional

            message_group { # list

              message { # list

                custom_payload { # list
                  value = ""     # string | required

                }

                image_response_card { # list
                  title     = ""     # string | required
                  image_url = ""     # string | optional
                  subtitle  = ""     # string | optional

                  button { # list
                    text  = ""     # string | required
                    value = ""     # string | required

                  }

                }

                plain_text_message { # list
                  value = ""     # string | required

                }

                ssml_message { # list
                  value = ""     # string | required

                }

              }

              variation { # list

                custom_payload { # list
                  value = ""     # string | required

                }

                image_response_card { # list
                  title     = ""     # string | required
                  image_url = ""     # string | optional
                  subtitle  = ""     # string | optional

                  button { # list
                    text  = ""     # string | required
                    value = ""     # string | required

                  }

                }

                plain_text_message { # list
                  value = ""     # string | required

                }

                ssml_message { # list
                  value = ""     # string | required

                }

              }

            }

          }

          waiting_response { # list
            allow_interrupt = false  # bool | optional

            message_group { # list

              message { # list

                custom_payload { # list
                  value = ""     # string | required

                }

                image_response_card { # list
                  title     = ""     # string | required
                  image_url = ""     # string | optional
                  subtitle  = ""     # string | optional

                  button { # list
                    text  = ""     # string | required
                    value = ""     # string | required

                  }

                }

                plain_text_message { # list
                  value = ""     # string | required

                }

                ssml_message { # list
                  value = ""     # string | required

                }

              }

              variation { # list

                custom_payload { # list
                  value = ""     # string | required

                }

                image_response_card { # list
                  title     = ""     # string | required
                  image_url = ""     # string | optional
                  subtitle  = ""     # string | optional

                  button { # list
                    text  = ""     # string | required
                    value = ""     # string | required

                  }

                }

                plain_text_message { # list
                  value = ""     # string | required

                }

                ssml_message { # list
                  value = ""     # string | required

                }

              }

            }

          }

        }

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

  value_elicitation_setting { # list
    slot_constraint = ""     # string | required

    default_value_specification { # list

      default_value_list { # list
        default_value = ""     # string | required

      }

    }

    prompt_specification { # list
      max_retries                = 0      # number | required
      allow_interrupt            = false  # bool | optional
      message_selection_strategy = ""     # string | optional

      message_group { # list

        message { # list

          custom_payload { # list
            value = ""     # string | required

          }

          image_response_card { # list
            title     = ""     # string | required
            image_url = ""     # string | optional
            subtitle  = ""     # string | optional

            button { # list
              text  = ""     # string | required
              value = ""     # string | required

            }

          }

          plain_text_message { # list
            value = ""     # string | required

          }

          ssml_message { # list
            value = ""     # string | required

          }

        }

        variation { # list

          custom_payload { # list
            value = ""     # string | required

          }

          image_response_card { # list
            title     = ""     # string | required
            image_url = ""     # string | optional
            subtitle  = ""     # string | optional

            button { # list
              text  = ""     # string | required
              value = ""     # string | required

            }

          }

          plain_text_message { # list
            value = ""     # string | required

          }

          ssml_message { # list
            value = ""     # string | required

          }

        }

      }

      prompt_attempts_specification { # set
        map_block_key   = ""     # string | required
        allow_interrupt = false  # bool | optional

        allowed_input_types { # list
          allow_audio_input = false  # bool | required
          allow_dtmf_input  = false  # bool | required

        }

        audio_and_dtmf_input_specification { # list
          start_timeout_ms = 0      # number | required

          audio_specification { # list
            end_timeout_ms = 0      # number | required
            max_length_ms  = 0      # number | required

          }

          dtmf_specification { # list
            deletion_character = ""     # string | required
            end_character      = ""     # string | required
            end_timeout_ms     = 0      # number | required
            max_length         = 0      # number | required

          }

        }

        text_input_specification { # list
          start_timeout_ms = 0      # number | required

        }

      }

    }

    sample_utterance { # list
      utterance = ""     # string | required

    }

    slot_resolution_setting { # list
      slot_resolution_strategy = ""     # string | required

    }

    wait_and_continue_specification { # list
      active = false  # bool | optional

      continue_response { # list
        allow_interrupt = false  # bool | optional

        message_group { # list

          message { # list

            custom_payload { # list
              value = ""     # string | required

            }

            image_response_card { # list
              title     = ""     # string | required
              image_url = ""     # string | optional
              subtitle  = ""     # string | optional

              button { # list
                text  = ""     # string | required
                value = ""     # string | required

              }

            }

            plain_text_message { # list
              value = ""     # string | required

            }

            ssml_message { # list
              value = ""     # string | required

            }

          }

          variation { # list

            custom_payload { # list
              value = ""     # string | required

            }

            image_response_card { # list
              title     = ""     # string | required
              image_url = ""     # string | optional
              subtitle  = ""     # string | optional

              button { # list
                text  = ""     # string | required
                value = ""     # string | required

              }

            }

            plain_text_message { # list
              value = ""     # string | required

            }

            ssml_message { # list
              value = ""     # string | required

            }

          }

        }

      }

      still_waiting_response { # list
        frequency_in_seconds = 0      # number | required
        timeout_in_seconds   = 0      # number | required
        allow_interrupt      = false  # bool | optional

        message_group { # list

          message { # list

            custom_payload { # list
              value = ""     # string | required

            }

            image_response_card { # list
              title     = ""     # string | required
              image_url = ""     # string | optional
              subtitle  = ""     # string | optional

              button { # list
                text  = ""     # string | required
                value = ""     # string | required

              }

            }

            plain_text_message { # list
              value = ""     # string | required

            }

            ssml_message { # list
              value = ""     # string | required

            }

          }

          variation { # list

            custom_payload { # list
              value = ""     # string | required

            }

            image_response_card { # list
              title     = ""     # string | required
              image_url = ""     # string | optional
              subtitle  = ""     # string | optional

              button { # list
                text  = ""     # string | required
                value = ""     # string | required

              }

            }

            plain_text_message { # list
              value = ""     # string | required

            }

            ssml_message { # list
              value = ""     # string | required

            }

          }

        }

      }

      waiting_response { # list
        allow_interrupt = false  # bool | optional

        message_group { # list

          message { # list

            custom_payload { # list
              value = ""     # string | required

            }

            image_response_card { # list
              title     = ""     # string | required
              image_url = ""     # string | optional
              subtitle  = ""     # string | optional

              button { # list
                text  = ""     # string | required
                value = ""     # string | required

              }

            }

            plain_text_message { # list
              value = ""     # string | required

            }

            ssml_message { # list
              value = ""     # string | required

            }

          }

          variation { # list

            custom_payload { # list
              value = ""     # string | required

            }

            image_response_card { # list
              title     = ""     # string | required
              image_url = ""     # string | optional
              subtitle  = ""     # string | optional

              button { # list
                text  = ""     # string | required
                value = ""     # string | required

              }

            }

            plain_text_message { # list
              value = ""     # string | required

            }

            ssml_message { # list
              value = ""     # string | required

            }

          }

        }

      }

    }

  }

}


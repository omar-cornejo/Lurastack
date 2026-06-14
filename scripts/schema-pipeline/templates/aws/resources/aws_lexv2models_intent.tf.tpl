# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lexv2models_intent                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lexv2models_intent" "this" {

  bot_id                  = ""     # string | required
  bot_version             = ""     # string | required
  locale_id               = ""     # string | required
  name                    = ""     # string | required
  description             = ""     # string | optional
  parent_intent_signature = ""     # string | optional

  # creation_date_time      = ""     # string | computed
  # id                      = ""     # string | computed
  # intent_id               = ""     # string | computed
  # last_updated_date_time  = ""     # string | computed

  closing_setting { # list
    active = false  # bool | optional

    closing_response { # list
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

    conditional { # list
      active = false  # bool | required

      conditional_branch { # list
        name = ""     # string | required

        condition { # list
          expression_string = ""     # string | required

        }

        next_step { # list
          session_attributes = {}     # map(string) | optional

          dialog_action { # list
            type                  = ""     # string | required
            slot_to_elicit        = ""     # string | optional
            suppress_next_message = false  # bool | optional

          }

          intent { # list
            name = ""     # string | optional

            slot { # set
              map_block_key = ""     # string | required
              shape         = ""     # string | optional

              value { # list
                interpreted_value = ""     # string | optional

              }

            }

          }

        }

        response { # list
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

      default_branch { # list

        next_step { # list
          session_attributes = {}     # map(string) | optional

          dialog_action { # list
            type                  = ""     # string | required
            slot_to_elicit        = ""     # string | optional
            suppress_next_message = false  # bool | optional

          }

          intent { # list
            name = ""     # string | optional

            slot { # set
              map_block_key = ""     # string | required
              shape         = ""     # string | optional

              value { # list
                interpreted_value = ""     # string | optional

              }

            }

          }

        }

        response { # list
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

    next_step { # list
      session_attributes = {}     # map(string) | optional

      dialog_action { # list
        type                  = ""     # string | required
        slot_to_elicit        = ""     # string | optional
        suppress_next_message = false  # bool | optional

      }

      intent { # list
        name = ""     # string | optional

        slot { # set
          map_block_key = ""     # string | required
          shape         = ""     # string | optional

          value { # list
            interpreted_value = ""     # string | optional

          }

        }

      }

    }

  }

  confirmation_setting { # list
    active = false  # bool | optional

    code_hook { # list
      active                      = false  # bool | required
      enable_code_hook_invocation = false  # bool | required
      invocation_label            = ""     # string | optional

      post_code_hook_specification { # list

        failure_conditional { # list
          active = false  # bool | required

          conditional_branch { # list
            name = ""     # string | required

            condition { # list
              expression_string = ""     # string | required

            }

            next_step { # list
              session_attributes = {}     # map(string) | optional

              dialog_action { # list
                type                  = ""     # string | required
                slot_to_elicit        = ""     # string | optional
                suppress_next_message = false  # bool | optional

              }

              intent { # list
                name = ""     # string | optional

                slot { # set
                  map_block_key = ""     # string | required
                  shape         = ""     # string | optional

                  value { # list
                    interpreted_value = ""     # string | optional

                  }

                }

              }

            }

            response { # list
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

          default_branch { # list

            next_step { # list
              session_attributes = {}     # map(string) | optional

              dialog_action { # list
                type                  = ""     # string | required
                slot_to_elicit        = ""     # string | optional
                suppress_next_message = false  # bool | optional

              }

              intent { # list
                name = ""     # string | optional

                slot { # set
                  map_block_key = ""     # string | required
                  shape         = ""     # string | optional

                  value { # list
                    interpreted_value = ""     # string | optional

                  }

                }

              }

            }

            response { # list
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

        failure_next_step { # list
          session_attributes = {}     # map(string) | optional

          dialog_action { # list
            type                  = ""     # string | required
            slot_to_elicit        = ""     # string | optional
            suppress_next_message = false  # bool | optional

          }

          intent { # list
            name = ""     # string | optional

            slot { # set
              map_block_key = ""     # string | required
              shape         = ""     # string | optional

              value { # list
                interpreted_value = ""     # string | optional

              }

            }

          }

        }

        failure_response { # list
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

        success_conditional { # list
          active = false  # bool | required

          conditional_branch { # list
            name = ""     # string | required

            condition { # list
              expression_string = ""     # string | required

            }

            next_step { # list
              session_attributes = {}     # map(string) | optional

              dialog_action { # list
                type                  = ""     # string | required
                slot_to_elicit        = ""     # string | optional
                suppress_next_message = false  # bool | optional

              }

              intent { # list
                name = ""     # string | optional

                slot { # set
                  map_block_key = ""     # string | required
                  shape         = ""     # string | optional

                  value { # list
                    interpreted_value = ""     # string | optional

                  }

                }

              }

            }

            response { # list
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

          default_branch { # list

            next_step { # list
              session_attributes = {}     # map(string) | optional

              dialog_action { # list
                type                  = ""     # string | required
                slot_to_elicit        = ""     # string | optional
                suppress_next_message = false  # bool | optional

              }

              intent { # list
                name = ""     # string | optional

                slot { # set
                  map_block_key = ""     # string | required
                  shape         = ""     # string | optional

                  value { # list
                    interpreted_value = ""     # string | optional

                  }

                }

              }

            }

            response { # list
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

        success_next_step { # list
          session_attributes = {}     # map(string) | optional

          dialog_action { # list
            type                  = ""     # string | required
            slot_to_elicit        = ""     # string | optional
            suppress_next_message = false  # bool | optional

          }

          intent { # list
            name = ""     # string | optional

            slot { # set
              map_block_key = ""     # string | required
              shape         = ""     # string | optional

              value { # list
                interpreted_value = ""     # string | optional

              }

            }

          }

        }

        success_response { # list
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

        timeout_conditional { # list
          active = false  # bool | required

          conditional_branch { # list
            name = ""     # string | required

            condition { # list
              expression_string = ""     # string | required

            }

            next_step { # list
              session_attributes = {}     # map(string) | optional

              dialog_action { # list
                type                  = ""     # string | required
                slot_to_elicit        = ""     # string | optional
                suppress_next_message = false  # bool | optional

              }

              intent { # list
                name = ""     # string | optional

                slot { # set
                  map_block_key = ""     # string | required
                  shape         = ""     # string | optional

                  value { # list
                    interpreted_value = ""     # string | optional

                  }

                }

              }

            }

            response { # list
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

          default_branch { # list

            next_step { # list
              session_attributes = {}     # map(string) | optional

              dialog_action { # list
                type                  = ""     # string | required
                slot_to_elicit        = ""     # string | optional
                suppress_next_message = false  # bool | optional

              }

              intent { # list
                name = ""     # string | optional

                slot { # set
                  map_block_key = ""     # string | required
                  shape         = ""     # string | optional

                  value { # list
                    interpreted_value = ""     # string | optional

                  }

                }

              }

            }

            response { # list
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

        timeout_next_step { # list
          session_attributes = {}     # map(string) | optional

          dialog_action { # list
            type                  = ""     # string | required
            slot_to_elicit        = ""     # string | optional
            suppress_next_message = false  # bool | optional

          }

          intent { # list
            name = ""     # string | optional

            slot { # set
              map_block_key = ""     # string | required
              shape         = ""     # string | optional

              value { # list
                interpreted_value = ""     # string | optional

              }

            }

          }

        }

        timeout_response { # list
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

    confirmation_conditional { # list
      active = false  # bool | required

      conditional_branch { # list
        name = ""     # string | required

        condition { # list
          expression_string = ""     # string | required

        }

        next_step { # list
          session_attributes = {}     # map(string) | optional

          dialog_action { # list
            type                  = ""     # string | required
            slot_to_elicit        = ""     # string | optional
            suppress_next_message = false  # bool | optional

          }

          intent { # list
            name = ""     # string | optional

            slot { # set
              map_block_key = ""     # string | required
              shape         = ""     # string | optional

              value { # list
                interpreted_value = ""     # string | optional

              }

            }

          }

        }

        response { # list
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

      default_branch { # list

        next_step { # list
          session_attributes = {}     # map(string) | optional

          dialog_action { # list
            type                  = ""     # string | required
            slot_to_elicit        = ""     # string | optional
            suppress_next_message = false  # bool | optional

          }

          intent { # list
            name = ""     # string | optional

            slot { # set
              map_block_key = ""     # string | required
              shape         = ""     # string | optional

              value { # list
                interpreted_value = ""     # string | optional

              }

            }

          }

        }

        response { # list
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

    confirmation_next_step { # list
      session_attributes = {}     # map(string) | optional

      dialog_action { # list
        type                  = ""     # string | required
        slot_to_elicit        = ""     # string | optional
        suppress_next_message = false  # bool | optional

      }

      intent { # list
        name = ""     # string | optional

        slot { # set
          map_block_key = ""     # string | required
          shape         = ""     # string | optional

          value { # list
            interpreted_value = ""     # string | optional

          }

        }

      }

    }

    confirmation_response { # list
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

    declination_conditional { # list
      active = false  # bool | required

      conditional_branch { # list
        name = ""     # string | required

        condition { # list
          expression_string = ""     # string | required

        }

        next_step { # list
          session_attributes = {}     # map(string) | optional

          dialog_action { # list
            type                  = ""     # string | required
            slot_to_elicit        = ""     # string | optional
            suppress_next_message = false  # bool | optional

          }

          intent { # list
            name = ""     # string | optional

            slot { # set
              map_block_key = ""     # string | required
              shape         = ""     # string | optional

              value { # list
                interpreted_value = ""     # string | optional

              }

            }

          }

        }

        response { # list
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

      default_branch { # list

        next_step { # list
          session_attributes = {}     # map(string) | optional

          dialog_action { # list
            type                  = ""     # string | required
            slot_to_elicit        = ""     # string | optional
            suppress_next_message = false  # bool | optional

          }

          intent { # list
            name = ""     # string | optional

            slot { # set
              map_block_key = ""     # string | required
              shape         = ""     # string | optional

              value { # list
                interpreted_value = ""     # string | optional

              }

            }

          }

        }

        response { # list
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

    declination_next_step { # list
      session_attributes = {}     # map(string) | optional

      dialog_action { # list
        type                  = ""     # string | required
        slot_to_elicit        = ""     # string | optional
        suppress_next_message = false  # bool | optional

      }

      intent { # list
        name = ""     # string | optional

        slot { # set
          map_block_key = ""     # string | required
          shape         = ""     # string | optional

          value { # list
            interpreted_value = ""     # string | optional

          }

        }

      }

    }

    declination_response { # list
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

    elicitation_code_hook { # list
      enable_code_hook_invocation = false  # bool | optional
      invocation_label            = ""     # string | optional

    }

    failure_conditional { # list
      active = false  # bool | required

      conditional_branch { # list
        name = ""     # string | required

        condition { # list
          expression_string = ""     # string | required

        }

        next_step { # list
          session_attributes = {}     # map(string) | optional

          dialog_action { # list
            type                  = ""     # string | required
            slot_to_elicit        = ""     # string | optional
            suppress_next_message = false  # bool | optional

          }

          intent { # list
            name = ""     # string | optional

            slot { # set
              map_block_key = ""     # string | required
              shape         = ""     # string | optional

              value { # list
                interpreted_value = ""     # string | optional

              }

            }

          }

        }

        response { # list
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

      default_branch { # list

        next_step { # list
          session_attributes = {}     # map(string) | optional

          dialog_action { # list
            type                  = ""     # string | required
            slot_to_elicit        = ""     # string | optional
            suppress_next_message = false  # bool | optional

          }

          intent { # list
            name = ""     # string | optional

            slot { # set
              map_block_key = ""     # string | required
              shape         = ""     # string | optional

              value { # list
                interpreted_value = ""     # string | optional

              }

            }

          }

        }

        response { # list
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

    failure_next_step { # list
      session_attributes = {}     # map(string) | optional

      dialog_action { # list
        type                  = ""     # string | required
        slot_to_elicit        = ""     # string | optional
        suppress_next_message = false  # bool | optional

      }

      intent { # list
        name = ""     # string | optional

        slot { # set
          map_block_key = ""     # string | required
          shape         = ""     # string | optional

          value { # list
            interpreted_value = ""     # string | optional

          }

        }

      }

    }

    failure_response { # list
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

  }

  dialog_code_hook { # list
    enabled = false  # bool | required

  }

  fulfillment_code_hook { # list
    enabled = false  # bool | required
    active  = false  # bool | optional

    fulfillment_updates_specification { # list
      active             = false  # bool | required
      timeout_in_seconds = 0      # number | optional

      start_response { # list
        allow_interrupt  = false  # bool | optional
        delay_in_seconds = 0      # number | optional

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

      update_response { # list
        frequency_in_seconds = 0      # number | required
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

    }

    post_fulfillment_status_specification { # list

      failure_conditional { # list
        active = false  # bool | required

        conditional_branch { # list
          name = ""     # string | required

          condition { # list
            expression_string = ""     # string | required

          }

          next_step { # list
            session_attributes = {}     # map(string) | optional

            dialog_action { # list
              type                  = ""     # string | required
              slot_to_elicit        = ""     # string | optional
              suppress_next_message = false  # bool | optional

            }

            intent { # list
              name = ""     # string | optional

              slot { # set
                map_block_key = ""     # string | required
                shape         = ""     # string | optional

                value { # list
                  interpreted_value = ""     # string | optional

                }

              }

            }

          }

          response { # list
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

        default_branch { # list

          next_step { # list
            session_attributes = {}     # map(string) | optional

            dialog_action { # list
              type                  = ""     # string | required
              slot_to_elicit        = ""     # string | optional
              suppress_next_message = false  # bool | optional

            }

            intent { # list
              name = ""     # string | optional

              slot { # set
                map_block_key = ""     # string | required
                shape         = ""     # string | optional

                value { # list
                  interpreted_value = ""     # string | optional

                }

              }

            }

          }

          response { # list
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

      failure_next_step { # list
        session_attributes = {}     # map(string) | optional

        dialog_action { # list
          type                  = ""     # string | required
          slot_to_elicit        = ""     # string | optional
          suppress_next_message = false  # bool | optional

        }

        intent { # list
          name = ""     # string | optional

          slot { # set
            map_block_key = ""     # string | required
            shape         = ""     # string | optional

            value { # list
              interpreted_value = ""     # string | optional

            }

          }

        }

      }

      failure_response { # list
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

      success_conditional { # list
        active = false  # bool | required

        conditional_branch { # list
          name = ""     # string | required

          condition { # list
            expression_string = ""     # string | required

          }

          next_step { # list
            session_attributes = {}     # map(string) | optional

            dialog_action { # list
              type                  = ""     # string | required
              slot_to_elicit        = ""     # string | optional
              suppress_next_message = false  # bool | optional

            }

            intent { # list
              name = ""     # string | optional

              slot { # set
                map_block_key = ""     # string | required
                shape         = ""     # string | optional

                value { # list
                  interpreted_value = ""     # string | optional

                }

              }

            }

          }

          response { # list
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

        default_branch { # list

          next_step { # list
            session_attributes = {}     # map(string) | optional

            dialog_action { # list
              type                  = ""     # string | required
              slot_to_elicit        = ""     # string | optional
              suppress_next_message = false  # bool | optional

            }

            intent { # list
              name = ""     # string | optional

              slot { # set
                map_block_key = ""     # string | required
                shape         = ""     # string | optional

                value { # list
                  interpreted_value = ""     # string | optional

                }

              }

            }

          }

          response { # list
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

      success_next_step { # list
        session_attributes = {}     # map(string) | optional

        dialog_action { # list
          type                  = ""     # string | required
          slot_to_elicit        = ""     # string | optional
          suppress_next_message = false  # bool | optional

        }

        intent { # list
          name = ""     # string | optional

          slot { # set
            map_block_key = ""     # string | required
            shape         = ""     # string | optional

            value { # list
              interpreted_value = ""     # string | optional

            }

          }

        }

      }

      success_response { # list
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

      timeout_conditional { # list
        active = false  # bool | required

        conditional_branch { # list
          name = ""     # string | required

          condition { # list
            expression_string = ""     # string | required

          }

          next_step { # list
            session_attributes = {}     # map(string) | optional

            dialog_action { # list
              type                  = ""     # string | required
              slot_to_elicit        = ""     # string | optional
              suppress_next_message = false  # bool | optional

            }

            intent { # list
              name = ""     # string | optional

              slot { # set
                map_block_key = ""     # string | required
                shape         = ""     # string | optional

                value { # list
                  interpreted_value = ""     # string | optional

                }

              }

            }

          }

          response { # list
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

        default_branch { # list

          next_step { # list
            session_attributes = {}     # map(string) | optional

            dialog_action { # list
              type                  = ""     # string | required
              slot_to_elicit        = ""     # string | optional
              suppress_next_message = false  # bool | optional

            }

            intent { # list
              name = ""     # string | optional

              slot { # set
                map_block_key = ""     # string | required
                shape         = ""     # string | optional

                value { # list
                  interpreted_value = ""     # string | optional

                }

              }

            }

          }

          response { # list
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

      timeout_next_step { # list
        session_attributes = {}     # map(string) | optional

        dialog_action { # list
          type                  = ""     # string | required
          slot_to_elicit        = ""     # string | optional
          suppress_next_message = false  # bool | optional

        }

        intent { # list
          name = ""     # string | optional

          slot { # set
            map_block_key = ""     # string | required
            shape         = ""     # string | optional

            value { # list
              interpreted_value = ""     # string | optional

            }

          }

        }

      }

      timeout_response { # list
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

  initial_response_setting { # list

    code_hook { # list
      active                      = false  # bool | required
      enable_code_hook_invocation = false  # bool | required
      invocation_label            = ""     # string | optional

      post_code_hook_specification { # list

        failure_conditional { # list
          active = false  # bool | required

          conditional_branch { # list
            name = ""     # string | required

            condition { # list
              expression_string = ""     # string | required

            }

            next_step { # list
              session_attributes = {}     # map(string) | optional

              dialog_action { # list
                type                  = ""     # string | required
                slot_to_elicit        = ""     # string | optional
                suppress_next_message = false  # bool | optional

              }

              intent { # list
                name = ""     # string | optional

                slot { # set
                  map_block_key = ""     # string | required
                  shape         = ""     # string | optional

                  value { # list
                    interpreted_value = ""     # string | optional

                  }

                }

              }

            }

            response { # list
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

          default_branch { # list

            next_step { # list
              session_attributes = {}     # map(string) | optional

              dialog_action { # list
                type                  = ""     # string | required
                slot_to_elicit        = ""     # string | optional
                suppress_next_message = false  # bool | optional

              }

              intent { # list
                name = ""     # string | optional

                slot { # set
                  map_block_key = ""     # string | required
                  shape         = ""     # string | optional

                  value { # list
                    interpreted_value = ""     # string | optional

                  }

                }

              }

            }

            response { # list
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

        failure_next_step { # list
          session_attributes = {}     # map(string) | optional

          dialog_action { # list
            type                  = ""     # string | required
            slot_to_elicit        = ""     # string | optional
            suppress_next_message = false  # bool | optional

          }

          intent { # list
            name = ""     # string | optional

            slot { # set
              map_block_key = ""     # string | required
              shape         = ""     # string | optional

              value { # list
                interpreted_value = ""     # string | optional

              }

            }

          }

        }

        failure_response { # list
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

        success_conditional { # list
          active = false  # bool | required

          conditional_branch { # list
            name = ""     # string | required

            condition { # list
              expression_string = ""     # string | required

            }

            next_step { # list
              session_attributes = {}     # map(string) | optional

              dialog_action { # list
                type                  = ""     # string | required
                slot_to_elicit        = ""     # string | optional
                suppress_next_message = false  # bool | optional

              }

              intent { # list
                name = ""     # string | optional

                slot { # set
                  map_block_key = ""     # string | required
                  shape         = ""     # string | optional

                  value { # list
                    interpreted_value = ""     # string | optional

                  }

                }

              }

            }

            response { # list
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

          default_branch { # list

            next_step { # list
              session_attributes = {}     # map(string) | optional

              dialog_action { # list
                type                  = ""     # string | required
                slot_to_elicit        = ""     # string | optional
                suppress_next_message = false  # bool | optional

              }

              intent { # list
                name = ""     # string | optional

                slot { # set
                  map_block_key = ""     # string | required
                  shape         = ""     # string | optional

                  value { # list
                    interpreted_value = ""     # string | optional

                  }

                }

              }

            }

            response { # list
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

        success_next_step { # list
          session_attributes = {}     # map(string) | optional

          dialog_action { # list
            type                  = ""     # string | required
            slot_to_elicit        = ""     # string | optional
            suppress_next_message = false  # bool | optional

          }

          intent { # list
            name = ""     # string | optional

            slot { # set
              map_block_key = ""     # string | required
              shape         = ""     # string | optional

              value { # list
                interpreted_value = ""     # string | optional

              }

            }

          }

        }

        success_response { # list
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

        timeout_conditional { # list
          active = false  # bool | required

          conditional_branch { # list
            name = ""     # string | required

            condition { # list
              expression_string = ""     # string | required

            }

            next_step { # list
              session_attributes = {}     # map(string) | optional

              dialog_action { # list
                type                  = ""     # string | required
                slot_to_elicit        = ""     # string | optional
                suppress_next_message = false  # bool | optional

              }

              intent { # list
                name = ""     # string | optional

                slot { # set
                  map_block_key = ""     # string | required
                  shape         = ""     # string | optional

                  value { # list
                    interpreted_value = ""     # string | optional

                  }

                }

              }

            }

            response { # list
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

          default_branch { # list

            next_step { # list
              session_attributes = {}     # map(string) | optional

              dialog_action { # list
                type                  = ""     # string | required
                slot_to_elicit        = ""     # string | optional
                suppress_next_message = false  # bool | optional

              }

              intent { # list
                name = ""     # string | optional

                slot { # set
                  map_block_key = ""     # string | required
                  shape         = ""     # string | optional

                  value { # list
                    interpreted_value = ""     # string | optional

                  }

                }

              }

            }

            response { # list
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

        timeout_next_step { # list
          session_attributes = {}     # map(string) | optional

          dialog_action { # list
            type                  = ""     # string | required
            slot_to_elicit        = ""     # string | optional
            suppress_next_message = false  # bool | optional

          }

          intent { # list
            name = ""     # string | optional

            slot { # set
              map_block_key = ""     # string | required
              shape         = ""     # string | optional

              value { # list
                interpreted_value = ""     # string | optional

              }

            }

          }

        }

        timeout_response { # list
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

    conditional { # list
      active = false  # bool | required

      conditional_branch { # list
        name = ""     # string | required

        condition { # list
          expression_string = ""     # string | required

        }

        next_step { # list
          session_attributes = {}     # map(string) | optional

          dialog_action { # list
            type                  = ""     # string | required
            slot_to_elicit        = ""     # string | optional
            suppress_next_message = false  # bool | optional

          }

          intent { # list
            name = ""     # string | optional

            slot { # set
              map_block_key = ""     # string | required
              shape         = ""     # string | optional

              value { # list
                interpreted_value = ""     # string | optional

              }

            }

          }

        }

        response { # list
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

      default_branch { # list

        next_step { # list
          session_attributes = {}     # map(string) | optional

          dialog_action { # list
            type                  = ""     # string | required
            slot_to_elicit        = ""     # string | optional
            suppress_next_message = false  # bool | optional

          }

          intent { # list
            name = ""     # string | optional

            slot { # set
              map_block_key = ""     # string | required
              shape         = ""     # string | optional

              value { # list
                interpreted_value = ""     # string | optional

              }

            }

          }

        }

        response { # list
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

    initial_response { # list
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

    next_step { # list
      session_attributes = {}     # map(string) | optional

      dialog_action { # list
        type                  = ""     # string | required
        slot_to_elicit        = ""     # string | optional
        suppress_next_message = false  # bool | optional

      }

      intent { # list
        name = ""     # string | optional

        slot { # set
          map_block_key = ""     # string | required
          shape         = ""     # string | optional

          value { # list
            interpreted_value = ""     # string | optional

          }

        }

      }

    }

  }

  input_context { # list
    name = ""     # string | required

  }

  kendra_configuration { # list
    kendra_index                = ""     # string | required
    query_filter_string         = ""     # string | optional
    query_filter_string_enabled = false  # bool | optional

  }

  output_context { # list
    name                    = ""     # string | required
    time_to_live_in_seconds = 0      # number | required
    turns_to_live           = 0      # number | required

  }

  sample_utterance { # list
    utterance = ""     # string | required

  }

  slot_priority { # list
    priority = 0      # number | required
    slot_id  = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}


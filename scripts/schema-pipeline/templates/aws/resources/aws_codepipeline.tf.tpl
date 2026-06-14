# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codepipeline                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codepipeline" "this" {

  name           = ""     # string | required
  role_arn       = ""     # string | required
  execution_mode = ""     # string | optional
  id             = ""     # string | optional+computed
  pipeline_type  = ""     # string | optional
  tags           = {}     # map(string) | optional
  tags_all       = {}     # map(string) | optional+computed

  # arn            = ""     # string | computed
  # trigger_all = [  # list(object)
  #   {
  #     git_configuration = [  # list(object)
  #       {
  #         pull_request = [  # list(object)
  #           {
  #             branches = [  # list(object)
  #               {
  #                 excludes = []  # list(string)
  #                 includes = []  # list(string)
  #               }
  #             ]
  #             events = []  # list(string)
  #             file_paths = [  # list(object)
  #               {
  #                 excludes = []  # list(string)
  #                 includes = []  # list(string)
  #               }
  #             ]
  #           }
  #         ]
  #         push = [  # list(object)
  #           {
  #             branches = [  # list(object)
  #               {
  #                 excludes = []  # list(string)
  #                 includes = []  # list(string)
  #               }
  #             ]
  #             file_paths = [  # list(object)
  #               {
  #                 excludes = []  # list(string)
  #                 includes = []  # list(string)
  #               }
  #             ]
  #             tags = [  # list(object)
  #               {
  #                 excludes = []  # list(string)
  #                 includes = []  # list(string)
  #               }
  #             ]
  #           }
  #         ]
  #         source_action_name = ""
  #       }
  #     ]
  #     provider_type = ""
  #   }
  # ]

  artifact_store { # set [1..*]
    location = ""     # string | required
    type     = ""     # string | required
    region   = ""     # string | optional

    encryption_key { # list [0..1]
      id   = ""     # string | required
      type = ""     # string | required

    }

  }

  stage { # list [2..*]
    name = ""     # string | required

    action { # list [1..*]
      category           = ""     # string | required
      name               = ""     # string | required
      owner              = ""     # string | required
      provider           = ""     # string | required
      version            = ""     # string | required
      configuration      = {}     # map(string) | optional
      input_artifacts    = []     # list(string) | optional
      namespace          = ""     # string | optional
      output_artifacts   = []     # list(string) | optional
      region             = ""     # string | optional+computed
      role_arn           = ""     # string | optional
      run_order          = 0      # number | optional+computed
      timeout_in_minutes = 0      # number | optional

    }

    before_entry { # list [0..1]

      condition { # list [1..1]
        result = ""     # string | optional

        rule { # list [1..5]
          name               = ""     # string | required
          commands           = []     # list(string) | optional
          configuration      = {}     # map(string) | optional
          input_artifacts    = []     # list(string) | optional
          region             = ""     # string | optional
          role_arn           = ""     # string | optional
          timeout_in_minutes = 0      # number | optional

          rule_type_id { # list [1..1]
            category = ""     # string | required
            provider = ""     # string | required
            owner    = ""     # string | optional
            version  = ""     # string | optional

          }

        }

      }

    }

    on_failure { # list [0..1]
      result = ""     # string | optional

      condition { # list [0..1]
        result = ""     # string | optional

        rule { # list [1..5]
          name               = ""     # string | required
          commands           = []     # list(string) | optional
          configuration      = {}     # map(string) | optional
          input_artifacts    = []     # list(string) | optional
          region             = ""     # string | optional
          role_arn           = ""     # string | optional
          timeout_in_minutes = 0      # number | optional

          rule_type_id { # list [1..1]
            category = ""     # string | required
            provider = ""     # string | required
            owner    = ""     # string | optional
            version  = ""     # string | optional

          }

        }

      }

      retry_configuration { # list [0..1]
        retry_mode = ""     # string | optional

      }

    }

    on_success { # list [0..1]

      condition { # list [1..1]
        result = ""     # string | optional

        rule { # list [1..5]
          name               = ""     # string | required
          commands           = []     # list(string) | optional
          configuration      = {}     # map(string) | optional
          input_artifacts    = []     # list(string) | optional
          region             = ""     # string | optional
          role_arn           = ""     # string | optional
          timeout_in_minutes = 0      # number | optional

          rule_type_id { # list [1..1]
            category = ""     # string | required
            provider = ""     # string | required
            owner    = ""     # string | optional
            version  = ""     # string | optional

          }

        }

      }

    }

  }

  trigger { # list [0..50]
    provider_type = ""     # string | required

    git_configuration { # list [1..1]
      source_action_name = ""     # string | required

      pull_request { # list [0..3]
        events = []     # list(string) | optional

        branches { # list [0..1]
          excludes = []     # list(string) | optional
          includes = []     # list(string) | optional

        }

        file_paths { # list [0..1]
          excludes = []     # list(string) | optional
          includes = []     # list(string) | optional

        }

      }

      push { # list [0..3]

        branches { # list [0..1]
          excludes = []     # list(string) | optional
          includes = []     # list(string) | optional

        }

        file_paths { # list [0..1]
          excludes = []     # list(string) | optional
          includes = []     # list(string) | optional

        }

        tags { # list [0..1]
          excludes = []     # list(string) | optional
          includes = []     # list(string) | optional

        }

      }

    }

  }

  variable { # list
    name          = ""     # string | required
    default_value = ""     # string | optional
    description   = ""     # string | optional

  }

}


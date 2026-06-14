# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_bedrockagent_agent_action_group                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_bedrockagent_agent_action_group" "this" {

  action_group_name             = ""     # string | required
  agent_id                      = ""     # string | required
  agent_version                 = ""     # string | required
  action_group_state            = ""     # string | optional+computed
  description                   = ""     # string | optional
  parent_action_group_signature = ""     # string | optional
  prepare_agent                 = false  # bool | optional+computed
  skip_resource_in_use_check    = false  # bool | optional+computed

  # action_group_id               = ""     # string | computed
  # id                            = ""     # string | computed

  action_group_executor { # list
    custom_control = ""     # string | optional
    lambda         = ""     # string | optional

  }

  api_schema { # list
    payload = ""     # string | optional

    s3 { # list
      s3_bucket_name = ""     # string | optional
      s3_object_key  = ""     # string | optional

    }

  }

  function_schema { # list

    member_functions { # list

      functions { # list
        name        = ""     # string | required
        description = ""     # string | optional

        parameters { # set
          map_block_key = ""     # string | required
          type          = ""     # string | required
          description   = ""     # string | optional
          required      = false  # bool | optional

        }

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_bedrockagent_agent_versions                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_bedrockagent_agent_versions" "this" {

  agent_id = ""     # string | required

  agent_version_summaries { # list

    # agent_name    = ""     # string | computed
    # agent_status  = ""     # string | computed
    # agent_version = ""     # string | computed
    # created_at    = ""     # string | computed
    # description   = ""     # string | computed
    # updated_at    = ""     # string | computed

    guardrail_configuration { # list

      # guardrail_identifier = ""     # string | computed
      # guardrail_version    = ""     # string | computed

    }

  }

}


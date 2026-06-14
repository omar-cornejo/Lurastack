# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_bedrockagent_agent_collaborator                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_bedrockagent_agent_collaborator" "this" {

  agent_id                   = ""     # string | required
  collaboration_instruction  = ""     # string | required
  collaborator_name          = ""     # string | required
  agent_version              = ""     # string | optional+computed
  prepare_agent              = false  # bool | optional+computed
  relay_conversation_history = ""     # string | optional+computed

  # collaborator_id            = ""     # string | computed
  # id                         = ""     # string | computed

  agent_descriptor { # list
    alias_arn = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}


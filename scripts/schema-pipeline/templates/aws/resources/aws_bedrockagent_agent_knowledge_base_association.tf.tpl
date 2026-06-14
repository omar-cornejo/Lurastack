# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_bedrockagent_agent_knowledge_base_association   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_bedrockagent_agent_knowledge_base_association" "this" {

  agent_id             = ""     # string | required
  description          = ""     # string | required
  knowledge_base_id    = ""     # string | required
  knowledge_base_state = ""     # string | required
  agent_version        = ""     # string | optional+computed

  # id                   = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}


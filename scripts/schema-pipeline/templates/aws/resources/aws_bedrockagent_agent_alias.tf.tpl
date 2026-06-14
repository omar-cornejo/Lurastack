# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_bedrockagent_agent_alias                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_bedrockagent_agent_alias" "this" {

  agent_alias_name      = ""     # string | required
  agent_id              = ""     # string | required
  description           = ""     # string | optional
  routing_configuration = []     # list(object({ agent_version: string, provisioned_throughput: string })) | optional+computed
  tags                  = {}     # map(string) | optional

  # agent_alias_arn       = ""     # string | computed
  # agent_alias_id        = ""     # string | computed
  # id                    = ""     # string | computed
  # tags_all              = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}


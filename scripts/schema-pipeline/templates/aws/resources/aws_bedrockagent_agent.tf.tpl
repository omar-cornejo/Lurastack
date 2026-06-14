# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_bedrockagent_agent                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_bedrockagent_agent" "this" {

  agent_name                    = ""     # string | required
  agent_resource_role_arn       = ""     # string | required
  foundation_model              = ""     # string | required
  agent_collaboration           = ""     # string | optional+computed
  customer_encryption_key_arn   = ""     # string | optional
  description                   = ""     # string | optional
  guardrail_configuration       = []     # list(object({ guardrail_identifier: string, guardrail_version: string })) | optional
  idle_session_ttl_in_seconds   = 0      # number | optional+computed
  instruction                   = ""     # string | optional+computed
  memory_configuration          = []     # list(object({ enabled_memory_types: list(string), storage_days: number })) | optional+computed
  prepare_agent                 = false  # bool | optional+computed
  prompt_override_configuration = []     # list(object({ override_lambda: string, prompt_configurations: set(object({ base_prompt_template: string, inference_configuration: list(object({ max_length: number, stop_sequences: list(string), temperature: number, top_k: number, top_p: number })), parser_mode: string, prompt_creation_mode: string, prompt_state: string, prompt_type: string })) })) | optional+computed
  skip_resource_in_use_check    = false  # bool | optional+computed
  tags                          = {}     # map(string) | optional

  # agent_arn                     = ""     # string | computed
  # agent_id                      = ""     # string | computed
  # agent_version                 = ""     # string | computed
  # id                            = ""     # string | computed
  # prepared_at                   = ""     # string | computed
  # tags_all                      = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}


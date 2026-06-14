# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_connect_instance                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_connect_instance" "this" {

  id                               = ""     # string | optional+computed
  instance_alias                   = ""     # string | optional+computed
  instance_id                      = ""     # string | optional+computed
  tags                             = {}     # map(string) | optional+computed

  # arn                              = ""     # string | computed
  # auto_resolve_best_voices_enabled = false  # bool | computed
  # contact_flow_logs_enabled        = false  # bool | computed
  # contact_lens_enabled             = false  # bool | computed
  # created_time                     = ""     # string | computed
  # early_media_enabled              = false  # bool | computed
  # identity_management_type         = ""     # string | computed
  # inbound_calls_enabled            = false  # bool | computed
  # multi_party_conference_enabled   = false  # bool | computed
  # outbound_calls_enabled           = false  # bool | computed
  # service_role                     = ""     # string | computed
  # status                           = ""     # string | computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_connect_instance                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_connect_instance" "this" {

  identity_management_type         = ""     # string | required
  inbound_calls_enabled            = false  # bool | required
  outbound_calls_enabled           = false  # bool | required
  auto_resolve_best_voices_enabled = false  # bool | optional
  contact_flow_logs_enabled        = false  # bool | optional
  contact_lens_enabled             = false  # bool | optional
  directory_id                     = ""     # string | optional
  early_media_enabled              = false  # bool | optional
  id                               = ""     # string | optional+computed
  instance_alias                   = ""     # string | optional
  multi_party_conference_enabled   = false  # bool | optional
  tags                             = {}     # map(string) | optional
  tags_all                         = {}     # map(string) | optional+computed

  # arn                              = ""     # string | computed
  # created_time                     = ""     # string | computed
  # service_role                     = ""     # string | computed
  # status                           = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}


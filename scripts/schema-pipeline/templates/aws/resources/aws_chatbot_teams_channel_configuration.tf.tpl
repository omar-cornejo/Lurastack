# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_chatbot_teams_channel_configuration             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_chatbot_teams_channel_configuration" "this" {

  channel_id                  = ""     # string | required
  configuration_name          = ""     # string | required
  iam_role_arn                = ""     # string | required
  team_id                     = ""     # string | required
  tenant_id                   = ""     # string | required
  channel_name                = ""     # string | optional+computed
  guardrail_policy_arns       = []     # list(string) | optional+computed
  logging_level               = ""     # string | optional+computed
  sns_topic_arns              = []     # set(string) | optional+computed
  tags                        = {}     # map(string) | optional
  team_name                   = ""     # string | optional+computed
  user_authorization_required = false  # bool | optional+computed

  # chat_configuration_arn      = ""     # string | computed
  # tags_all                    = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}


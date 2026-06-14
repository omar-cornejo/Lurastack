# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_chatbot_slack_channel_configuration             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_chatbot_slack_channel_configuration" "this" {

  configuration_name          = ""     # string | required
  iam_role_arn                = ""     # string | required
  slack_channel_id            = ""     # string | required
  slack_team_id               = ""     # string | required
  guardrail_policy_arns       = []     # list(string) | optional+computed
  logging_level               = ""     # string | optional+computed
  sns_topic_arns              = []     # set(string) | optional+computed
  tags                        = {}     # map(string) | optional
  user_authorization_required = false  # bool | optional+computed

  # chat_configuration_arn      = ""     # string | computed
  # slack_channel_name          = ""     # string | computed
  # slack_team_name             = ""     # string | computed
  # tags_all                    = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}


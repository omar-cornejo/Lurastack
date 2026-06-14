# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_chatbot_slack_workspace                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_chatbot_slack_workspace" "this" {

  slack_team_name = ""     # string | required

  # slack_team_id   = ""     # string | computed

}


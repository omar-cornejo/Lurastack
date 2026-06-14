# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codedeploy_app                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codedeploy_app" "this" {

  name                = ""     # string | required
  compute_platform    = ""     # string | optional
  id                  = ""     # string | optional+computed
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed

  # application_id      = ""     # string | computed
  # arn                 = ""     # string | computed
  # github_account_name = ""     # string | computed
  # linked_to_github    = false  # bool | computed

}


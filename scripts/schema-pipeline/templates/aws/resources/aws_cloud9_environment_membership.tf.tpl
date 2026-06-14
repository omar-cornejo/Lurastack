# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloud9_environment_membership                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloud9_environment_membership" "this" {

  environment_id = ""     # string | required
  permissions    = ""     # string | required
  user_arn       = ""     # string | required
  id             = ""     # string | optional+computed

  # user_id        = ""     # string | computed

}


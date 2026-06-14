# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_secretsmanager_secret_versions                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_secretsmanager_secret_versions" "this" {

  secret_id          = ""     # string | required
  include_deprecated = false  # bool | optional

  # arn                = ""     # string | computed
  # name               = ""     # string | computed
  # versions = [  # list(object)
  #   {
  #     created_time = ""
  #     last_accessed_date = ""
  #     version_id = ""
  #     version_stages = []  # list(string)
  #   }
  # ]

}


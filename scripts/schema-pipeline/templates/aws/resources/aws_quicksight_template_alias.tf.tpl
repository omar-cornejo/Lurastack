# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_quicksight_template_alias                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_quicksight_template_alias" "this" {

  alias_name              = ""     # string | required
  template_id             = ""     # string | required
  template_version_number = 0      # number | required
  aws_account_id          = ""     # string | optional+computed

  # arn                     = ""     # string | computed
  # id                      = ""     # string | computed

}


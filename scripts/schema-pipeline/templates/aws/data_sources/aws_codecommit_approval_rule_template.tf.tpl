# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_codecommit_approval_rule_template                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_codecommit_approval_rule_template" "this" {

  name                      = ""     # string | required
  id                        = ""     # string | optional+computed

  # approval_rule_template_id = ""     # string | computed
  # content                   = ""     # string | computed
  # creation_date             = ""     # string | computed
  # description               = ""     # string | computed
  # last_modified_date        = ""     # string | computed
  # last_modified_user        = ""     # string | computed
  # rule_content_sha256       = ""     # string | computed

}


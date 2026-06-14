# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codecommit_approval_rule_template               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codecommit_approval_rule_template" "this" {

  content                   = ""     # string | required
  name                      = ""     # string | required
  description               = ""     # string | optional
  id                        = ""     # string | optional+computed

  # approval_rule_template_id = ""     # string | computed
  # creation_date             = ""     # string | computed
  # last_modified_date        = ""     # string | computed
  # last_modified_user        = ""     # string | computed
  # rule_content_sha256       = ""     # string | computed

}


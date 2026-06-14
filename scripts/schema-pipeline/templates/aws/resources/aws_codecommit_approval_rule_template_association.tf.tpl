# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codecommit_approval_rule_template_association   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codecommit_approval_rule_template_association" "this" {

  approval_rule_template_name = ""     # string | required
  repository_name             = ""     # string | required
  id                          = ""     # string | optional+computed

}


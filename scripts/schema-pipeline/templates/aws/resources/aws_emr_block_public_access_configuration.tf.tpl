# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_emr_block_public_access_configuration           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_emr_block_public_access_configuration" "this" {

  block_public_security_group_rules = false  # bool | required
  id                                = ""     # string | optional+computed

  permitted_public_security_group_rule_range { # list
    max_range = 0      # number | required
    min_range = 0      # number | required

  }

}


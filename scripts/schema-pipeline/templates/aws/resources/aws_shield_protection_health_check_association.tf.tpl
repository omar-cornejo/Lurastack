# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_shield_protection_health_check_association      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_shield_protection_health_check_association" "this" {

  health_check_arn     = ""     # string | required
  shield_protection_id = ""     # string | required
  id                   = ""     # string | optional+computed

}


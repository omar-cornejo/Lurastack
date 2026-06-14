# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_auditmanager_assessment_delegation              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_auditmanager_assessment_delegation" "this" {

  assessment_id  = ""     # string | required
  control_set_id = ""     # string | required
  role_arn       = ""     # string | required
  role_type      = ""     # string | required
  comment        = ""     # string | optional

  # delegation_id  = ""     # string | computed
  # id             = ""     # string | computed
  # status         = ""     # string | computed

}


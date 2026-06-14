# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_auditmanager_assessment_report                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_auditmanager_assessment_report" "this" {

  assessment_id = ""     # string | required
  name          = ""     # string | required
  description   = ""     # string | optional

  # author        = ""     # string | computed
  # id            = ""     # string | computed
  # status        = ""     # string | computed

}


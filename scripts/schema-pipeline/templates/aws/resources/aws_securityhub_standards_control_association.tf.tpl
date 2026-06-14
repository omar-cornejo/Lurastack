# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_securityhub_standards_control_association       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_securityhub_standards_control_association" "this" {

  association_status  = ""     # string | required
  security_control_id = ""     # string | required
  standards_arn       = ""     # string | required
  updated_reason      = ""     # string | optional

  # id                  = ""     # string | computed

}


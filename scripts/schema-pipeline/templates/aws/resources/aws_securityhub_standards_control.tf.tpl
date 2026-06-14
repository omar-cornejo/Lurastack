# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_securityhub_standards_control                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_securityhub_standards_control" "this" {

  control_status            = ""     # string | required
  standards_control_arn     = ""     # string | required
  disabled_reason           = ""     # string | optional+computed
  id                        = ""     # string | optional+computed

  # control_id                = ""     # string | computed
  # control_status_updated_at = ""     # string | computed
  # description               = ""     # string | computed
  # related_requirements      = []     # list(string) | computed
  # remediation_url           = ""     # string | computed
  # severity_rating           = ""     # string | computed
  # title                     = ""     # string | computed

}


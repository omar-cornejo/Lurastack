# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_guardduty_finding_ids                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_guardduty_finding_ids" "this" {

  detector_id  = ""     # string | required

  # finding_ids  = []     # list(string) | computed
  # has_findings = false  # bool | computed
  # id           = ""     # string | computed

}


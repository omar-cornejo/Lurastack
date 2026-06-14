# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_auditmanager_framework_share                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_auditmanager_framework_share" "this" {

  destination_account = ""     # string | required
  destination_region  = ""     # string | required
  framework_id        = ""     # string | required
  comment             = ""     # string | optional

  # id                  = ""     # string | computed
  # status              = ""     # string | computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_securityhub_account                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_securityhub_account" "this" {

  auto_enable_controls      = false  # bool | optional
  control_finding_generator = ""     # string | optional+computed
  enable_default_standards  = false  # bool | optional
  id                        = ""     # string | optional+computed

  # arn                       = ""     # string | computed

}


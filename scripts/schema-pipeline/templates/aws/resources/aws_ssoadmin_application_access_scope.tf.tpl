# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssoadmin_application_access_scope               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssoadmin_application_access_scope" "this" {

  application_arn    = ""     # string | required
  scope              = ""     # string | required
  authorized_targets = []     # list(string) | optional

  # id                 = ""     # string | computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssoadmin_application_assignment                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssoadmin_application_assignment" "this" {

  application_arn = ""     # string | required
  principal_id    = ""     # string | required
  principal_type  = ""     # string | required

  # id              = ""     # string | computed

}


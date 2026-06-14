# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssoadmin_application_assignment_configuration   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssoadmin_application_assignment_configuration" "this" {

  application_arn     = ""     # string | required
  assignment_required = false  # bool | required

  # id                  = ""     # string | computed

}


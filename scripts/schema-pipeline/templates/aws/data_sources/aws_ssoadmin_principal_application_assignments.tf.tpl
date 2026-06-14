# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ssoadmin_principal_application_assignments          │
# └──────────────────────────────────────────────────────────────┘
data "aws_ssoadmin_principal_application_assignments" "this" {

  instance_arn   = ""     # string | required
  principal_id   = ""     # string | required
  principal_type = ""     # string | required

  # id             = ""     # string | computed

  application_assignments { # list

    # application_arn = ""     # string | computed
    # principal_id    = ""     # string | computed
    # principal_type  = ""     # string | computed

  }

}


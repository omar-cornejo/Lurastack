# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ssoadmin_application_assignments                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_ssoadmin_application_assignments" "this" {

  application_arn = ""     # string | required

  # id              = ""     # string | computed

  application_assignments { # list

    # application_arn = ""     # string | computed
    # principal_id    = ""     # string | computed
    # principal_type  = ""     # string | computed

  }

}


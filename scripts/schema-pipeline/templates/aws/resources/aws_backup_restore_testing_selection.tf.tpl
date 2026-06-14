# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_backup_restore_testing_selection                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_backup_restore_testing_selection" "this" {

  iam_role_arn               = ""     # string | required
  name                       = ""     # string | required
  protected_resource_type    = ""     # string | required
  restore_testing_plan_name  = ""     # string | required
  protected_resource_arns    = []     # set(string) | optional+computed
  restore_metadata_overrides = {}     # map(string) | optional+computed
  validation_window_hours    = 0      # number | optional+computed

  protected_resource_conditions { # list

    string_equals { # list
      key   = ""     # string | required
      value = ""     # string | required

    }

    string_not_equals { # list
      key   = ""     # string | required
      value = ""     # string | required

    }

  }

}


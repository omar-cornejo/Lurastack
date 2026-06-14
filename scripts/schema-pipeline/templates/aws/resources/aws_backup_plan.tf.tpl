# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_backup_plan                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_backup_plan" "this" {

  name     = ""     # string | required
  id       = ""     # string | optional+computed
  tags     = {}     # map(string) | optional
  tags_all = {}     # map(string) | optional+computed

  # arn      = ""     # string | computed
  # version  = ""     # string | computed

  advanced_backup_setting { # set
    backup_options = {}     # map(string) | required
    resource_type  = ""     # string | required

  }

  rule { # set [1..*]
    rule_name                    = ""     # string | required
    target_vault_name            = ""     # string | required
    completion_window            = 0      # number | optional
    enable_continuous_backup     = false  # bool | optional
    recovery_point_tags          = {}     # map(string) | optional
    schedule                     = ""     # string | optional
    schedule_expression_timezone = ""     # string | optional
    start_window                 = 0      # number | optional

    copy_action { # set
      destination_vault_arn = ""     # string | required

      lifecycle { # list [0..1]
        cold_storage_after                        = 0      # number | optional
        delete_after                              = 0      # number | optional
        opt_in_to_archive_for_supported_resources = false  # bool | optional+computed

      }

    }

    lifecycle { # list [0..1]
      cold_storage_after                        = 0      # number | optional
      delete_after                              = 0      # number | optional
      opt_in_to_archive_for_supported_resources = false  # bool | optional+computed

    }

  }

}


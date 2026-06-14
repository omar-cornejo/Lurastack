# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cleanrooms_membership                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cleanrooms_membership" "this" {

  collaboration_id                   = ""     # string | required
  query_log_status                   = ""     # string | required
  tags                               = {}     # map(string) | optional

  # arn                                = ""     # string | computed
  # collaboration_arn                  = ""     # string | computed
  # collaboration_creator_account_id   = ""     # string | computed
  # collaboration_creator_display_name = ""     # string | computed
  # collaboration_name                 = ""     # string | computed
  # create_time                        = ""     # string | computed
  # id                                 = ""     # string | computed
  # member_abilities                   = []     # list(string) | computed
  # status                             = ""     # string | computed
  # tags_all                           = {}     # map(string) | computed
  # update_time                        = ""     # string | computed

  default_result_configuration { # list
    role_arn = ""     # string | optional

    output_configuration { # list

      s3 { # list
        bucket        = ""     # string | required
        result_format = ""     # string | required
        key_prefix    = ""     # string | optional

      }

    }

  }

  payment_configuration { # list

    query_compute { # list
      is_responsible = false  # bool | required

    }

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cleanrooms_collaboration                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cleanrooms_collaboration" "this" {

  creator_display_name     = ""     # string | required
  creator_member_abilities = []     # list(string) | required
  description              = ""     # string | required
  name                     = ""     # string | required
  query_log_status         = ""     # string | required
  tags                     = {}     # map(string) | optional
  tags_all                 = {}     # map(string) | optional+computed

  # arn                      = ""     # string | computed
  # create_time              = ""     # string | computed
  # id                       = ""     # string | computed
  # update_time              = ""     # string | computed

  data_encryption_metadata { # list [0..1]
    allow_clear_text                            = false  # bool | required
    allow_duplicates                            = false  # bool | required
    allow_joins_on_columns_with_different_names = false  # bool | required
    preserve_nulls                              = false  # bool | required

  }

  member { # set
    account_id       = ""     # string | required
    display_name     = ""     # string | required
    member_abilities = []     # list(string) | required

    # status           = ""     # string | computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


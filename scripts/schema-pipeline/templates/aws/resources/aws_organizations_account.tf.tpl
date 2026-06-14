# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_organizations_account                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_organizations_account" "this" {

  email                      = ""     # string | required
  name                       = ""     # string | required
  close_on_deletion          = false  # bool | optional
  create_govcloud            = false  # bool | optional
  iam_user_access_to_billing = ""     # string | optional
  id                         = ""     # string | optional+computed
  parent_id                  = ""     # string | optional+computed
  role_name                  = ""     # string | optional
  tags                       = {}     # map(string) | optional
  tags_all                   = {}     # map(string) | optional+computed

  # arn                        = ""     # string | computed
  # govcloud_id                = ""     # string | computed
  # joined_method              = ""     # string | computed
  # joined_timestamp           = ""     # string | computed
  # status                     = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


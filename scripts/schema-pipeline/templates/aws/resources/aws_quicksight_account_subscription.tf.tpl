# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_quicksight_account_subscription                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_quicksight_account_subscription" "this" {

  account_name                     = ""     # string | required
  authentication_method            = ""     # string | required
  edition                          = ""     # string | required
  notification_email               = ""     # string | required
  active_directory_name            = ""     # string | optional
  admin_group                      = []     # list(string) | optional
  author_group                     = []     # list(string) | optional
  aws_account_id                   = ""     # string | optional+computed
  contact_number                   = ""     # string | optional
  directory_id                     = ""     # string | optional
  email_address                    = ""     # string | optional
  first_name                       = ""     # string | optional
  iam_identity_center_instance_arn = ""     # string | optional
  id                               = ""     # string | optional+computed
  last_name                        = ""     # string | optional
  reader_group                     = []     # list(string) | optional
  realm                            = ""     # string | optional

  # account_subscription_status      = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional

  }

}


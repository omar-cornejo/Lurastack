# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_kms_key                                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_kms_key" "this" {

  bypass_policy_lockout_safety_check = false  # bool | optional
  custom_key_store_id                = ""     # string | optional
  customer_master_key_spec           = ""     # string | optional
  deletion_window_in_days            = 0      # number | optional
  description                        = ""     # string | optional+computed
  enable_key_rotation                = false  # bool | optional
  id                                 = ""     # string | optional+computed
  is_enabled                         = false  # bool | optional
  key_usage                          = ""     # string | optional
  multi_region                       = false  # bool | optional+computed
  policy                             = ""     # string | optional+computed
  rotation_period_in_days            = 0      # number | optional+computed
  tags                               = {}     # map(string) | optional
  tags_all                           = {}     # map(string) | optional+computed
  xks_key_id                         = ""     # string | optional

  # arn                                = ""     # string | computed
  # key_id                             = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional

  }

}


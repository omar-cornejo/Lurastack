# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_kms_replica_key                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_kms_replica_key" "this" {

  primary_key_arn                    = ""     # string | required
  bypass_policy_lockout_safety_check = false  # bool | optional
  deletion_window_in_days            = 0      # number | optional
  description                        = ""     # string | optional
  enabled                            = false  # bool | optional
  id                                 = ""     # string | optional+computed
  policy                             = ""     # string | optional+computed
  tags                               = {}     # map(string) | optional
  tags_all                           = {}     # map(string) | optional+computed

  # arn                                = ""     # string | computed
  # key_id                             = ""     # string | computed
  # key_rotation_enabled               = false  # bool | computed
  # key_spec                           = ""     # string | computed
  # key_usage                          = ""     # string | computed

}


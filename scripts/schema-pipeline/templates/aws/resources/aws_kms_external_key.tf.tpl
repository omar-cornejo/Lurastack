# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_kms_external_key                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_kms_external_key" "this" {

  bypass_policy_lockout_safety_check = false  # bool | optional
  deletion_window_in_days            = 0      # number | optional
  description                        = ""     # string | optional
  enabled                            = false  # bool | optional+computed
  id                                 = ""     # string | optional+computed
  key_material_base64                = ""     # string | optional+sensitive
  multi_region                       = false  # bool | optional+computed
  policy                             = ""     # string | optional+computed
  tags                               = {}     # map(string) | optional
  tags_all                           = {}     # map(string) | optional+computed
  valid_to                           = ""     # string | optional

  # arn                                = ""     # string | computed
  # expiration_model                   = ""     # string | computed
  # key_state                          = ""     # string | computed
  # key_usage                          = ""     # string | computed

}


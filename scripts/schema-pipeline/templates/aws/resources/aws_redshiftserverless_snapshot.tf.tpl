# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshiftserverless_snapshot                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshiftserverless_snapshot" "this" {

  namespace_name                           = ""     # string | required
  snapshot_name                            = ""     # string | required
  id                                       = ""     # string | optional+computed
  retention_period                         = 0      # number | optional

  # accounts_with_provisioned_restore_access = []     # set(string) | computed
  # accounts_with_restore_access             = []     # set(string) | computed
  # admin_username                           = ""     # string | computed
  # arn                                      = ""     # string | computed
  # kms_key_id                               = ""     # string | computed
  # namespace_arn                            = ""     # string | computed
  # owner_account                            = ""     # string | computed

}


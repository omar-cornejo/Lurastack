# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshiftserverless_namespace                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshiftserverless_namespace" "this" {

  namespace_name                   = ""     # string | required
  admin_password_secret_kms_key_id = ""     # string | optional+computed
  admin_user_password              = ""     # string | optional+sensitive
  admin_user_password_wo           = ""     # string | optional+write_only
  admin_user_password_wo_version   = 0      # number | optional
  admin_username                   = ""     # string | optional+computed+sensitive
  db_name                          = ""     # string | optional+computed
  default_iam_role_arn             = ""     # string | optional
  iam_roles                        = []     # set(string) | optional+computed
  id                               = ""     # string | optional+computed
  kms_key_id                       = ""     # string | optional+computed
  log_exports                      = []     # set(string) | optional
  manage_admin_password            = false  # bool | optional
  tags                             = {}     # map(string) | optional
  tags_all                         = {}     # map(string) | optional+computed

  # admin_password_secret_arn        = ""     # string | computed
  # arn                              = ""     # string | computed
  # namespace_id                     = ""     # string | computed

}


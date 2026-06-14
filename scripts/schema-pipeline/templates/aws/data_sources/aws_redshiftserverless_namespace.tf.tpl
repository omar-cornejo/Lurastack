# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_redshiftserverless_namespace                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_redshiftserverless_namespace" "this" {

  namespace_name       = ""     # string | required
  id                   = ""     # string | optional+computed

  # admin_username       = ""     # string | computed
  # arn                  = ""     # string | computed
  # db_name              = ""     # string | computed
  # default_iam_role_arn = ""     # string | computed
  # iam_roles            = []     # set(string) | computed
  # kms_key_id           = ""     # string | computed
  # log_exports          = []     # set(string) | computed
  # namespace_id         = ""     # string | computed

}


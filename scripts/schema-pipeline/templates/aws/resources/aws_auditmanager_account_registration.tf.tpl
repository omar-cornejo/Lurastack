# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_auditmanager_account_registration               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_auditmanager_account_registration" "this" {

  delegated_admin_account = ""     # string | optional
  deregister_on_destroy   = false  # bool | optional
  kms_key                 = ""     # string | optional

  # id                      = ""     # string | computed
  # status                  = ""     # string | computed

}


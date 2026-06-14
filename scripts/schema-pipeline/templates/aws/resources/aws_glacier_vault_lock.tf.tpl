# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_glacier_vault_lock                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_glacier_vault_lock" "this" {

  complete_lock         = false  # bool | required
  policy                = ""     # string | required
  vault_name            = ""     # string | required
  id                    = ""     # string | optional+computed
  ignore_deletion_error = false  # bool | optional

}


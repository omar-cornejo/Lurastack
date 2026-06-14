# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_kms_grant                                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_kms_grant" "this" {

  grantee_principal     = ""     # string | required
  key_id                = ""     # string | required
  operations            = []     # set(string) | required
  grant_creation_tokens = []     # set(string) | optional
  id                    = ""     # string | optional+computed
  name                  = ""     # string | optional
  retire_on_delete      = false  # bool | optional
  retiring_principal    = ""     # string | optional

  # grant_id              = ""     # string | computed
  # grant_token           = ""     # string | computed+sensitive

  constraints { # set
    encryption_context_equals = {}     # map(string) | optional
    encryption_context_subset = {}     # map(string) | optional

  }

}


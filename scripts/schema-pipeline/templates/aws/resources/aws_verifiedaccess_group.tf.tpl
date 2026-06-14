# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_verifiedaccess_group                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_verifiedaccess_group" "this" {

  verifiedaccess_instance_id = ""     # string | required
  description                = ""     # string | optional+computed
  id                         = ""     # string | optional+computed
  policy_document            = ""     # string | optional
  tags                       = {}     # map(string) | optional
  tags_all                   = {}     # map(string) | optional+computed

  # creation_time              = ""     # string | computed
  # deletion_time              = ""     # string | computed
  # last_updated_time          = ""     # string | computed
  # owner                      = ""     # string | computed
  # verifiedaccess_group_arn   = ""     # string | computed
  # verifiedaccess_group_id    = ""     # string | computed

  sse_configuration { # list [0..1]
    customer_managed_key_enabled = false  # bool | optional
    kms_key_arn                  = ""     # string | optional

  }

}


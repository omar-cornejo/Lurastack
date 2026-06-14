# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_identitystore_group_membership                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_identitystore_group_membership" "this" {

  group_id          = ""     # string | required
  identity_store_id = ""     # string | required
  member_id         = ""     # string | required
  id                = ""     # string | optional+computed

  # membership_id     = ""     # string | computed

}


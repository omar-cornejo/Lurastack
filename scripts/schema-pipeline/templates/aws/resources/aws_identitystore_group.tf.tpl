# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_identitystore_group                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_identitystore_group" "this" {

  display_name      = ""     # string | required
  identity_store_id = ""     # string | required
  description       = ""     # string | optional
  id                = ""     # string | optional+computed

  # external_ids = [  # list(object)
  #   {
  #     id = ""
  #     issuer = ""
  #   }
  # ]
  # group_id          = ""     # string | computed

}


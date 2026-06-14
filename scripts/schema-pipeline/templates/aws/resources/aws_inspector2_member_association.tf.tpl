# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_inspector2_member_association                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_inspector2_member_association" "this" {

  account_id                 = ""     # string | required
  id                         = ""     # string | optional+computed

  # delegated_admin_account_id = ""     # string | computed
  # relationship_status        = ""     # string | computed
  # updated_at                 = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}


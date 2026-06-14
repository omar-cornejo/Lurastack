# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_organizations_policy_attachment                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_organizations_policy_attachment" "this" {

  policy_id    = ""     # string | required
  target_id    = ""     # string | required
  id           = ""     # string | optional+computed
  skip_destroy = false  # bool | optional

}


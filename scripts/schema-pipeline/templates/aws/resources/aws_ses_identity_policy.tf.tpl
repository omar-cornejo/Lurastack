# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ses_identity_policy                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ses_identity_policy" "this" {

  identity = ""     # string | required
  name     = ""     # string | required
  policy   = ""     # string | required
  id       = ""     # string | optional+computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_saml_provider                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_saml_provider" "this" {

  name                   = ""     # string | required
  saml_metadata_document = ""     # string | required
  id                     = ""     # string | optional+computed
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed
  # valid_until            = ""     # string | computed

}


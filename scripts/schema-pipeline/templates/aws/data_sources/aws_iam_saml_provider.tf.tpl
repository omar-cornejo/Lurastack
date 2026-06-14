# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_iam_saml_provider                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_iam_saml_provider" "this" {

  arn                    = ""     # string | required
  id                     = ""     # string | optional+computed
  tags                   = {}     # map(string) | optional+computed

  # create_date            = ""     # string | computed
  # name                   = ""     # string | computed
  # saml_metadata_document = ""     # string | computed
  # valid_until            = ""     # string | computed

}


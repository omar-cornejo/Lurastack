# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codeartifact_domain_permissions_policy          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codeartifact_domain_permissions_policy" "this" {

  domain          = ""     # string | required
  policy_document = ""     # string | required
  domain_owner    = ""     # string | optional+computed
  id              = ""     # string | optional+computed
  policy_revision = ""     # string | optional+computed

  # resource_arn    = ""     # string | computed

}


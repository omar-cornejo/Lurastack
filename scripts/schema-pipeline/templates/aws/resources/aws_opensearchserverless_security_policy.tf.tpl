# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_opensearchserverless_security_policy            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_opensearchserverless_security_policy" "this" {

  name           = ""     # string | required | Name of the policy.
  policy         = ""     # string | required | JSON policy document to use as the content for the new polic…
  type           = ""     # string | required | Type of security policy. One of `encryption` or `network`.
  description    = ""     # string | optional | Description of the policy. Typically used to store informati…

  # id             = ""     # string | computed
  # policy_version = ""     # string | computed | Version of the policy.

}


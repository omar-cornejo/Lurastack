# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_opensearchserverless_access_policy              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_opensearchserverless_access_policy" "this" {

  name           = ""     # string | required | Name of the policy.
  policy         = ""     # string | required | JSON policy document to use as the content for the new polic…
  type           = ""     # string | required | Type of access policy. Must be `data`.
  description    = ""     # string | optional | Description of the policy. Typically used to store informati…

  # id             = ""     # string | computed
  # policy_version = ""     # string | computed | Version of the policy.

}


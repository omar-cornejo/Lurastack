# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_opensearchserverless_access_policy                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_opensearchserverless_access_policy" "this" {

  name           = ""     # string | required | Name of the policy.
  type           = ""     # string | required | Type of access policy. Must be `data`.

  # description    = ""     # string | computed | Description of the policy. Typically used to store informati…
  # id             = ""     # string | computed
  # policy         = ""     # string | computed | JSON policy document to use as the content for the new polic…
  # policy_version = ""     # string | computed | Version of the policy.

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_opensearchserverless_lifecycle_policy           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_opensearchserverless_lifecycle_policy" "this" {

  name           = ""     # string | required | Name of the policy.
  policy         = ""     # string | required | JSON policy document to use as the content for the new polic…
  type           = ""     # string | required | Type of lifecycle policy. Must be `retention`.
  description    = ""     # string | optional | Description of the policy.

  # id             = ""     # string | computed
  # policy_version = ""     # string | computed | Version of the policy.

}


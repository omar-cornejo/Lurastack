# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_opensearchserverless_lifecycle_policy               │
# └──────────────────────────────────────────────────────────────┘
data "aws_opensearchserverless_lifecycle_policy" "this" {

  name               = ""     # string | required | Name of the policy.
  type               = ""     # string | required | Type of lifecycle policy. Must be `retention`.

  # created_date       = ""     # string | computed | The date the lifecycle policy was created.
  # description        = ""     # string | computed | Description of the policy. Typically used to store informati…
  # id                 = ""     # string | computed
  # last_modified_date = ""     # string | computed | The date the lifecycle policy was last modified.
  # policy             = ""     # string | computed | JSON policy document to use as the content for the new polic…
  # policy_version     = ""     # string | computed | Version of the policy.

}


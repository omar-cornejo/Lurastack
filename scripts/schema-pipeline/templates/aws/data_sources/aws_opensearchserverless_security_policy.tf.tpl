# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_opensearchserverless_security_policy                │
# └──────────────────────────────────────────────────────────────┘
data "aws_opensearchserverless_security_policy" "this" {

  name               = ""     # string | required | Name of the policy.
  type               = ""     # string | required | Type of security policy. One of `encryption` or `network`.
  id                 = ""     # string | optional+computed

  # created_date       = ""     # string | computed | The date the security policy was created.
  # description        = ""     # string | computed | Description of the security policy.
  # last_modified_date = ""     # string | computed | The date the security policy was last modified.
  # policy             = ""     # string | computed | The JSON policy document without any whitespaces.
  # policy_version     = ""     # string | computed | Version of the policy.

}


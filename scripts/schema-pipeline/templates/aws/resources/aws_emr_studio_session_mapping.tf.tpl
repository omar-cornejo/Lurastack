# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_emr_studio_session_mapping                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_emr_studio_session_mapping" "this" {

  identity_type      = ""     # string | required
  session_policy_arn = ""     # string | required
  studio_id          = ""     # string | required
  id                 = ""     # string | optional+computed
  identity_id        = ""     # string | optional+computed
  identity_name      = ""     # string | optional+computed

}


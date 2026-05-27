# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lambda_permission                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lambda_permission" "this" {

  action                 = ""     # string | required
  function_name          = ""     # string | required
  principal              = ""     # string | required
  event_source_token     = ""     # string | optional
  function_url_auth_type = ""     # string | optional
  id                     = ""     # string | optional+computed
  principal_org_id       = ""     # string | optional
  qualifier              = ""     # string | optional
  source_account         = ""     # string | optional
  source_arn             = ""     # string | optional
  statement_id           = ""     # string | optional+computed
  statement_id_prefix    = ""     # string | optional+computed

}


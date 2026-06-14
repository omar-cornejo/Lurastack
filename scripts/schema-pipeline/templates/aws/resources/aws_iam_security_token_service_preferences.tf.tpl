# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_security_token_service_preferences          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_security_token_service_preferences" "this" {

  global_endpoint_token_version = ""     # string | required
  id                            = ""     # string | optional+computed

}


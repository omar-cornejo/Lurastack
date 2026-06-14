# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codebuild_source_credential                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codebuild_source_credential" "this" {

  auth_type   = ""     # string | required
  server_type = ""     # string | required
  token       = ""     # string | required+sensitive
  id          = ""     # string | optional+computed
  user_name   = ""     # string | optional

  # arn         = ""     # string | computed

}


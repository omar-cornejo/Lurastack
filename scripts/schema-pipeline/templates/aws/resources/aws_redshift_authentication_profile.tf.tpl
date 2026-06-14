# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshift_authentication_profile                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshift_authentication_profile" "this" {

  authentication_profile_content = ""     # string | required
  authentication_profile_name    = ""     # string | required
  id                             = ""     # string | optional+computed

}


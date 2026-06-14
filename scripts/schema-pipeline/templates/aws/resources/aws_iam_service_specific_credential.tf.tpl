# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_service_specific_credential                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_service_specific_credential" "this" {

  service_name                   = ""     # string | required
  user_name                      = ""     # string | required
  id                             = ""     # string | optional+computed
  status                         = ""     # string | optional

  # service_password               = ""     # string | computed+sensitive
  # service_specific_credential_id = ""     # string | computed
  # service_user_name              = ""     # string | computed

}


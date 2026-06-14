# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cognito_user_pool_ui_customization              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cognito_user_pool_ui_customization" "this" {

  user_pool_id       = ""     # string | required
  client_id          = ""     # string | optional
  css                = ""     # string | optional
  id                 = ""     # string | optional+computed
  image_file         = ""     # string | optional

  # creation_date      = ""     # string | computed
  # css_version        = ""     # string | computed
  # image_url          = ""     # string | computed
  # last_modified_date = ""     # string | computed

}


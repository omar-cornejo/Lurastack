# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3control_object_lambda_access_point_policy     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3control_object_lambda_access_point_policy" "this" {

  name                     = ""     # string | required
  policy                   = ""     # string | required
  account_id               = ""     # string | optional+computed
  id                       = ""     # string | optional+computed

  # has_public_access_policy = false  # bool | computed

}


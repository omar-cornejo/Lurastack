# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3control_access_point_policy                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3control_access_point_policy" "this" {

  access_point_arn         = ""     # string | required
  policy                   = ""     # string | required
  id                       = ""     # string | optional+computed

  # has_public_access_policy = false  # bool | computed

}


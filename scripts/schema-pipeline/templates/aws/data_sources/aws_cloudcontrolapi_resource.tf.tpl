# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudcontrolapi_resource                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudcontrolapi_resource" "this" {

  identifier      = ""     # string | required
  type_name       = ""     # string | required
  id              = ""     # string | optional+computed
  role_arn        = ""     # string | optional
  type_version_id = ""     # string | optional

  # properties      = ""     # string | computed

}


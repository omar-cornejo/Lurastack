# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudcontrolapi_resource                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudcontrolapi_resource" "this" {

  desired_state   = ""     # string | required
  type_name       = ""     # string | required
  id              = ""     # string | optional+computed
  role_arn        = ""     # string | optional
  schema          = ""     # string | optional+computed+sensitive
  type_version_id = ""     # string | optional

  # properties      = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


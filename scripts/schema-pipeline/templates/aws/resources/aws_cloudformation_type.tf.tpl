# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudformation_type                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudformation_type" "this" {

  schema_handler_package = ""     # string | required
  type_name              = ""     # string | required
  execution_role_arn     = ""     # string | optional
  id                     = ""     # string | optional+computed
  type                   = ""     # string | optional+computed

  # arn                    = ""     # string | computed
  # default_version_id     = ""     # string | computed
  # deprecated_status      = ""     # string | computed
  # description            = ""     # string | computed
  # documentation_url      = ""     # string | computed
  # is_default_version     = false  # bool | computed
  # provisioning_type      = ""     # string | computed
  # schema                 = ""     # string | computed
  # source_url             = ""     # string | computed
  # type_arn               = ""     # string | computed
  # version_id             = ""     # string | computed
  # visibility             = ""     # string | computed

  logging_config { # list [0..1]
    log_group_name = ""     # string | required
    log_role_arn   = ""     # string | required

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudformation_type                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudformation_type" "this" {

  arn                = ""     # string | optional+computed
  id                 = ""     # string | optional+computed
  type               = ""     # string | optional+computed
  type_name          = ""     # string | optional+computed
  version_id         = ""     # string | optional

  # default_version_id = ""     # string | computed
  # deprecated_status  = ""     # string | computed
  # description        = ""     # string | computed
  # documentation_url  = ""     # string | computed
  # execution_role_arn = ""     # string | computed
  # is_default_version = false  # bool | computed
  # logging_config = [  # list(object)
  #   {
  #     log_group_name = ""
  #     log_role_arn = ""
  #   }
  # ]
  # provisioning_type  = ""     # string | computed
  # schema             = ""     # string | computed
  # source_url         = ""     # string | computed
  # type_arn           = ""     # string | computed
  # visibility         = ""     # string | computed

}


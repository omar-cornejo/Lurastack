# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_lambda_code_signing_config                          │
# └──────────────────────────────────────────────────────────────┘
data "aws_lambda_code_signing_config" "this" {

  arn                = ""     # string | required
  id                 = ""     # string | optional+computed

  # allowed_publishers = [  # list(object)
  #   {
  #     signing_profile_version_arns = []  # set(string)
  #   }
  # ]
  # config_id          = ""     # string | computed
  # description        = ""     # string | computed
  # last_modified      = ""     # string | computed
  # policies = [  # list(object)
  #   {
  #     untrusted_artifact_on_deployment = ""
  #   }
  # ]

}


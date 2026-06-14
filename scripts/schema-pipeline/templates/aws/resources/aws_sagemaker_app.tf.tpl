# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_app                                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_app" "this" {

  app_name          = ""     # string | required
  app_type          = ""     # string | required
  domain_id         = ""     # string | required
  id                = ""     # string | optional+computed
  space_name        = ""     # string | optional
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed
  user_profile_name = ""     # string | optional

  # arn               = ""     # string | computed

  resource_spec { # list [0..1]
    instance_type                 = ""     # string | optional
    lifecycle_config_arn          = ""     # string | optional
    sagemaker_image_arn           = ""     # string | optional+computed
    sagemaker_image_version_alias = ""     # string | optional
    sagemaker_image_version_arn   = ""     # string | optional

  }

}


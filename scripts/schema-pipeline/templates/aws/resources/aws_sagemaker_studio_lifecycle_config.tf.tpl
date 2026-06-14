# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_studio_lifecycle_config               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_studio_lifecycle_config" "this" {

  studio_lifecycle_config_app_type = ""     # string | required
  studio_lifecycle_config_content  = ""     # string | required
  studio_lifecycle_config_name     = ""     # string | required
  id                               = ""     # string | optional+computed
  tags                             = {}     # map(string) | optional
  tags_all                         = {}     # map(string) | optional+computed

  # arn                              = ""     # string | computed

}


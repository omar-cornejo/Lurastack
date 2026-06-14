# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_model_package_group                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_model_package_group" "this" {

  model_package_group_name        = ""     # string | required
  id                              = ""     # string | optional+computed
  model_package_group_description = ""     # string | optional
  tags                            = {}     # map(string) | optional
  tags_all                        = {}     # map(string) | optional+computed

  # arn                             = ""     # string | computed

}


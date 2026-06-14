# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_model_package_group_policy            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_model_package_group_policy" "this" {

  model_package_group_name = ""     # string | required
  resource_policy          = ""     # string | required
  id                       = ""     # string | optional+computed

}


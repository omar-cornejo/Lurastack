# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_sagemaker_prebuilt_ecr_image                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_sagemaker_prebuilt_ecr_image" "this" {

  repository_name = ""     # string | required
  dns_suffix      = ""     # string | optional
  id              = ""     # string | optional+computed
  image_tag       = ""     # string | optional
  region          = ""     # string | optional

  # registry_id     = ""     # string | computed
  # registry_path   = ""     # string | computed

}


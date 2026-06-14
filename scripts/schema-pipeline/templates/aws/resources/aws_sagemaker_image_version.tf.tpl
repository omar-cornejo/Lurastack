# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_image_version                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_image_version" "this" {

  base_image       = ""     # string | required
  image_name       = ""     # string | required
  horovod          = false  # bool | optional
  id               = ""     # string | optional+computed
  job_type         = ""     # string | optional
  ml_framework     = ""     # string | optional
  processor        = ""     # string | optional
  programming_lang = ""     # string | optional
  release_notes    = ""     # string | optional
  vendor_guidance  = ""     # string | optional

  # arn              = ""     # string | computed
  # container_image  = ""     # string | computed
  # image_arn        = ""     # string | computed
  # version          = 0      # number | computed

}


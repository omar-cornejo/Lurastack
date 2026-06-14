# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_image                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_image" "this" {

  image_name   = ""     # string | required
  role_arn     = ""     # string | required
  description  = ""     # string | optional
  display_name = ""     # string | optional
  id           = ""     # string | optional+computed
  tags         = {}     # map(string) | optional
  tags_all     = {}     # map(string) | optional+computed

  # arn          = ""     # string | computed

}


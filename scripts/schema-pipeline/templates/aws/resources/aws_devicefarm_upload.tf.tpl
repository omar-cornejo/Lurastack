# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_devicefarm_upload                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_devicefarm_upload" "this" {

  name         = ""     # string | required
  project_arn  = ""     # string | required
  type         = ""     # string | required
  content_type = ""     # string | optional
  id           = ""     # string | optional+computed

  # arn          = ""     # string | computed
  # category     = ""     # string | computed
  # metadata     = ""     # string | computed
  # url          = ""     # string | computed

}


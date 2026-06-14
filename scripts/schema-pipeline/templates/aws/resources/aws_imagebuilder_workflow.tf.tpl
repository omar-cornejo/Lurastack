# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_imagebuilder_workflow                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_imagebuilder_workflow" "this" {

  name               = ""     # string | required
  type               = ""     # string | required
  version            = ""     # string | required
  change_description = ""     # string | optional
  data               = ""     # string | optional+computed
  description        = ""     # string | optional
  id                 = ""     # string | optional+computed
  kms_key_id         = ""     # string | optional
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed
  uri                = ""     # string | optional

  # arn                = ""     # string | computed
  # date_created       = ""     # string | computed
  # owner              = ""     # string | computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_imagebuilder_component                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_imagebuilder_component" "this" {

  name                  = ""     # string | required
  platform              = ""     # string | required
  version               = ""     # string | required
  change_description    = ""     # string | optional
  data                  = ""     # string | optional+computed
  description           = ""     # string | optional
  id                    = ""     # string | optional+computed
  kms_key_id            = ""     # string | optional
  skip_destroy          = false  # bool | optional
  supported_os_versions = []     # set(string) | optional
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed
  uri                   = ""     # string | optional

  # arn                   = ""     # string | computed
  # date_created          = ""     # string | computed
  # encrypted             = false  # bool | computed
  # owner                 = ""     # string | computed
  # type                  = ""     # string | computed

}


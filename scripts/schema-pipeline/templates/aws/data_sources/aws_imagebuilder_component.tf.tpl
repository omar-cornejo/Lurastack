# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_imagebuilder_component                              │
# └──────────────────────────────────────────────────────────────┘
data "aws_imagebuilder_component" "this" {

  arn                   = ""     # string | required
  id                    = ""     # string | optional+computed
  tags                  = {}     # map(string) | optional+computed

  # change_description    = ""     # string | computed
  # data                  = ""     # string | computed
  # date_created          = ""     # string | computed
  # description           = ""     # string | computed
  # encrypted             = false  # bool | computed
  # kms_key_id            = ""     # string | computed
  # name                  = ""     # string | computed
  # owner                 = ""     # string | computed
  # platform              = ""     # string | computed
  # supported_os_versions = []     # set(string) | computed
  # type                  = ""     # string | computed
  # version               = ""     # string | computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssm_document                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssm_document" "this" {

  content          = ""     # string | required
  document_type    = ""     # string | required
  name             = ""     # string | required
  document_format  = ""     # string | optional
  id               = ""     # string | optional+computed
  permissions      = {}     # map(string) | optional
  tags             = {}     # map(string) | optional
  tags_all         = {}     # map(string) | optional+computed
  target_type      = ""     # string | optional
  version_name     = ""     # string | optional

  # arn              = ""     # string | computed
  # created_date     = ""     # string | computed
  # default_version  = ""     # string | computed
  # description      = ""     # string | computed
  # document_version = ""     # string | computed
  # hash             = ""     # string | computed
  # hash_type        = ""     # string | computed
  # latest_version   = ""     # string | computed
  # owner            = ""     # string | computed
  # parameter = [  # list(object)
  #   {
  #     default_value = ""
  #     description = ""
  #     name = ""
  #     type = ""
  #   }
  # ]
  # platform_types   = []     # list(string) | computed
  # schema_version   = ""     # string | computed
  # status           = ""     # string | computed

  attachments_source { # list [0..20]
    key    = ""     # string | required
    values = []     # list(string) | required
    name   = ""     # string | optional

  }

}


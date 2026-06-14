# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_elastic_beanstalk_application_version           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_elastic_beanstalk_application_version" "this" {

  application  = ""     # string | required
  bucket       = ""     # string | required
  key          = ""     # string | required
  name         = ""     # string | required
  description  = ""     # string | optional
  force_delete = false  # bool | optional
  id           = ""     # string | optional+computed
  process      = false  # bool | optional
  tags         = {}     # map(string) | optional
  tags_all     = {}     # map(string) | optional+computed

  # arn          = ""     # string | computed

}


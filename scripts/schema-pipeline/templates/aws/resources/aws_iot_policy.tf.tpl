# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iot_policy                                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iot_policy" "this" {

  name               = ""     # string | required
  policy             = ""     # string | required
  id                 = ""     # string | optional+computed
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed
  # default_version_id = ""     # string | computed

  timeouts { # single
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


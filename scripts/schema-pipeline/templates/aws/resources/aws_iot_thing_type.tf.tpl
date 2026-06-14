# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iot_thing_type                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iot_thing_type" "this" {

  name       = ""     # string | required
  deprecated = false  # bool | optional
  id         = ""     # string | optional+computed
  tags       = {}     # map(string) | optional
  tags_all   = {}     # map(string) | optional+computed

  # arn        = ""     # string | computed

  properties { # list [0..1]
    description           = ""     # string | optional
    searchable_attributes = []     # set(string) | optional+computed

  }

}


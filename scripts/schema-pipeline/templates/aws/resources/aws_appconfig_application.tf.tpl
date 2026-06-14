# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appconfig_application                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appconfig_application" "this" {

  name        = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed

}


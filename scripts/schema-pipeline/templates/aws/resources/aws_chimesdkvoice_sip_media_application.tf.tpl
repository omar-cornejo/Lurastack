# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_chimesdkvoice_sip_media_application             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_chimesdkvoice_sip_media_application" "this" {

  aws_region = ""     # string | required
  name       = ""     # string | required
  id         = ""     # string | optional+computed
  tags       = {}     # map(string) | optional
  tags_all   = {}     # map(string) | optional+computed

  # arn        = ""     # string | computed

  endpoints { # list [1..1]
    lambda_arn = ""     # string | required

  }

}


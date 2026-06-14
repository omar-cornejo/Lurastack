# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_glacier_vault                                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_glacier_vault" "this" {

  name          = ""     # string | required
  access_policy = ""     # string | optional
  id            = ""     # string | optional+computed
  tags          = {}     # map(string) | optional
  tags_all      = {}     # map(string) | optional+computed

  # arn           = ""     # string | computed
  # location      = ""     # string | computed

  notification { # list [0..1]
    events    = []     # set(string) | required
    sns_topic = ""     # string | required

  }

}


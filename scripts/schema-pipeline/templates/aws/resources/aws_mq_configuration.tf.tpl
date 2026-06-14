# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_mq_configuration                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_mq_configuration" "this" {

  data                    = ""     # string | required
  engine_type             = ""     # string | required
  engine_version          = ""     # string | required
  name                    = ""     # string | required
  authentication_strategy = ""     # string | optional+computed
  description             = ""     # string | optional
  id                      = ""     # string | optional+computed
  tags                    = {}     # map(string) | optional
  tags_all                = {}     # map(string) | optional+computed

  # arn                     = ""     # string | computed
  # latest_revision         = 0      # number | computed

}


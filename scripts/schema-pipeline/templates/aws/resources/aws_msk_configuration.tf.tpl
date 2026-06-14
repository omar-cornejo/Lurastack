# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_msk_configuration                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_msk_configuration" "this" {

  name              = ""     # string | required
  server_properties = ""     # string | required
  description       = ""     # string | optional
  id                = ""     # string | optional+computed
  kafka_versions    = []     # set(string) | optional

  # arn               = ""     # string | computed
  # latest_revision   = 0      # number | computed

}


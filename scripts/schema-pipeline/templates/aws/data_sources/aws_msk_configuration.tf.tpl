# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_msk_configuration                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_msk_configuration" "this" {

  name              = ""     # string | required
  id                = ""     # string | optional+computed

  # arn               = ""     # string | computed
  # description       = ""     # string | computed
  # kafka_versions    = []     # set(string) | computed
  # latest_revision   = 0      # number | computed
  # server_properties = ""     # string | computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_msk_kafka_version                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_msk_kafka_version" "this" {

  id                 = ""     # string | optional+computed
  preferred_versions = []     # list(string) | optional
  version            = ""     # string | optional+computed

  # status             = ""     # string | computed

}


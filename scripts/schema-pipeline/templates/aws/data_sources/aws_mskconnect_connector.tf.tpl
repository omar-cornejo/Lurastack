# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_mskconnect_connector                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_mskconnect_connector" "this" {

  name        = ""     # string | required
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed
  # description = ""     # string | computed
  # version     = ""     # string | computed

}


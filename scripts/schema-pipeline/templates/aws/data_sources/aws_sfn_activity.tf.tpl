# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_sfn_activity                                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_sfn_activity" "this" {

  arn           = ""     # string | optional+computed
  id            = ""     # string | optional+computed
  name          = ""     # string | optional+computed

  # creation_date = ""     # string | computed

}


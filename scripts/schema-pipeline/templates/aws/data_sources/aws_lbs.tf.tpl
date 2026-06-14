# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_lbs                                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_lbs" "this" {

  id   = ""     # string | optional+computed
  tags = {}     # map(string) | optional

  # arns = []     # set(string) | computed

}


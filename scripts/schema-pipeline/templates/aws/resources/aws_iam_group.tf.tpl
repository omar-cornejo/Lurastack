# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_group                                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_group" "this" {

  name      = ""     # string | required
  id        = ""     # string | optional+computed
  path      = ""     # string | optional

  # arn       = ""     # string | computed
  # unique_id = ""     # string | computed

}


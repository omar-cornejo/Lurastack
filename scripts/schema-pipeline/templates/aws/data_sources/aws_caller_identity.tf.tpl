# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_caller_identity                                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_caller_identity" "this" {

  id         = ""     # string | optional+computed

  # account_id = ""     # string | computed
  # arn        = ""     # string | computed
  # user_id    = ""     # string | computed

}


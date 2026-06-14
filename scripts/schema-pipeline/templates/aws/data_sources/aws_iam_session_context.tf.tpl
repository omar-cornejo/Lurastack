# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_iam_session_context                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_iam_session_context" "this" {

  arn          = ""     # string | required
  id           = ""     # string | optional+computed

  # issuer_arn   = ""     # string | computed
  # issuer_id    = ""     # string | computed
  # issuer_name  = ""     # string | computed
  # session_name = ""     # string | computed

}


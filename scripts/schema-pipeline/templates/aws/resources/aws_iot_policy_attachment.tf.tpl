# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iot_policy_attachment                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iot_policy_attachment" "this" {

  policy = ""     # string | required
  target = ""     # string | required
  id     = ""     # string | optional+computed

}


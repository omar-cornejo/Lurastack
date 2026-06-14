# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_log_destination                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_log_destination" "this" {

  name       = ""     # string | required
  role_arn   = ""     # string | required
  target_arn = ""     # string | required
  id         = ""     # string | optional+computed
  tags       = {}     # map(string) | optional
  tags_all   = {}     # map(string) | optional+computed

  # arn        = ""     # string | computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_apprunner_connection                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_apprunner_connection" "this" {

  connection_name = ""     # string | required
  provider_type   = ""     # string | required
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed
  # status          = ""     # string | computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codestarconnections_connection                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codestarconnections_connection" "this" {

  name              = ""     # string | required
  host_arn          = ""     # string | optional
  id                = ""     # string | optional+computed
  provider_type     = ""     # string | optional+computed
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # connection_status = ""     # string | computed

}


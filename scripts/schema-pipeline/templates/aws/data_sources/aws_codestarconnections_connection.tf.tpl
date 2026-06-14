# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_codestarconnections_connection                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_codestarconnections_connection" "this" {

  arn               = ""     # string | optional+computed
  id                = ""     # string | optional+computed
  name              = ""     # string | optional+computed
  tags              = {}     # map(string) | optional+computed

  # connection_status = ""     # string | computed
  # host_arn          = ""     # string | computed
  # provider_type     = ""     # string | computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_log_group                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_log_group" "this" {

  id                = ""     # string | optional+computed
  kms_key_id        = ""     # string | optional
  log_group_class   = ""     # string | optional+computed
  name              = ""     # string | optional+computed
  name_prefix       = ""     # string | optional+computed
  retention_in_days = 0      # number | optional
  skip_destroy      = false  # bool | optional
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudwatch_log_group                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudwatch_log_group" "this" {

  name              = ""     # string | required
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # creation_time     = 0      # number | computed
  # kms_key_id        = ""     # string | computed
  # log_group_class   = ""     # string | computed
  # retention_in_days = 0      # number | computed

}


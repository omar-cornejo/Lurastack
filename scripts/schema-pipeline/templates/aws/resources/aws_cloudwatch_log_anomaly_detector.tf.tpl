# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_log_anomaly_detector                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_log_anomaly_detector" "this" {

  enabled                 = false  # bool | required
  log_group_arn_list      = []     # list(string) | required
  anomaly_visibility_time = 0      # number | optional+computed
  detector_name           = ""     # string | optional
  evaluation_frequency    = ""     # string | optional
  filter_pattern          = ""     # string | optional
  kms_key_id              = ""     # string | optional
  tags                    = {}     # map(string) | optional

  # arn                     = ""     # string | computed
  # tags_all                = {}     # map(string) | computed

}


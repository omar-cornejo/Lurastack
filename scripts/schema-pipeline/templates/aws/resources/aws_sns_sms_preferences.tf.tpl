# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sns_sms_preferences                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sns_sms_preferences" "this" {

  default_sender_id                     = ""     # string | optional
  default_sms_type                      = ""     # string | optional
  delivery_status_iam_role_arn          = ""     # string | optional
  delivery_status_success_sampling_rate = ""     # string | optional
  id                                    = ""     # string | optional+computed
  monthly_spend_limit                   = 0      # number | optional+computed
  usage_report_s3_bucket                = ""     # string | optional

}


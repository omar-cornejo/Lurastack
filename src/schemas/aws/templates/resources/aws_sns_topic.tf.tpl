# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sns_topic                                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sns_topic" "this" {

  application_failure_feedback_role_arn    = ""     # string | optional
  application_success_feedback_role_arn    = ""     # string | optional
  application_success_feedback_sample_rate = 0      # number | optional
  archive_policy                           = ""     # string | optional
  content_based_deduplication              = false  # bool | optional
  delivery_policy                          = ""     # string | optional
  display_name                             = ""     # string | optional
  fifo_throughput_scope                    = ""     # string | optional+computed
  fifo_topic                               = false  # bool | optional
  firehose_failure_feedback_role_arn       = ""     # string | optional
  firehose_success_feedback_role_arn       = ""     # string | optional
  firehose_success_feedback_sample_rate    = 0      # number | optional
  http_failure_feedback_role_arn           = ""     # string | optional
  http_success_feedback_role_arn           = ""     # string | optional
  http_success_feedback_sample_rate        = 0      # number | optional
  id                                       = ""     # string | optional+computed
  kms_master_key_id                        = ""     # string | optional
  lambda_failure_feedback_role_arn         = ""     # string | optional
  lambda_success_feedback_role_arn         = ""     # string | optional
  lambda_success_feedback_sample_rate      = 0      # number | optional
  name                                     = ""     # string | optional+computed
  name_prefix                              = ""     # string | optional+computed
  policy                                   = ""     # string | optional+computed
  signature_version                        = 0      # number | optional+computed
  sqs_failure_feedback_role_arn            = ""     # string | optional
  sqs_success_feedback_role_arn            = ""     # string | optional
  sqs_success_feedback_sample_rate         = 0      # number | optional
  tags                                     = {}     # map(string) | optional
  tags_all                                 = {}     # map(string) | optional+computed
  tracing_config                           = ""     # string | optional+computed

  # arn                                      = ""     # string | computed
  # beginning_archive_time                   = ""     # string | computed
  # owner                                    = ""     # string | computed

}


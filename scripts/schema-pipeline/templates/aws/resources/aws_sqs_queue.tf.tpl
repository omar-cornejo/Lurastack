# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sqs_queue                                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sqs_queue" "this" {

  content_based_deduplication       = false  # bool | optional
  deduplication_scope               = ""     # string | optional+computed
  delay_seconds                     = 0      # number | optional
  fifo_queue                        = false  # bool | optional
  fifo_throughput_limit             = ""     # string | optional+computed
  id                                = ""     # string | optional+computed
  kms_data_key_reuse_period_seconds = 0      # number | optional+computed
  kms_master_key_id                 = ""     # string | optional
  max_message_size                  = 0      # number | optional
  message_retention_seconds         = 0      # number | optional
  name                              = ""     # string | optional+computed
  name_prefix                       = ""     # string | optional+computed
  policy                            = ""     # string | optional+computed
  receive_wait_time_seconds         = 0      # number | optional
  redrive_allow_policy              = ""     # string | optional+computed
  redrive_policy                    = ""     # string | optional+computed
  sqs_managed_sse_enabled           = false  # bool | optional+computed
  tags                              = {}     # map(string) | optional
  tags_all                          = {}     # map(string) | optional+computed
  visibility_timeout_seconds        = 0      # number | optional

  # arn                               = ""     # string | computed
  # url                               = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


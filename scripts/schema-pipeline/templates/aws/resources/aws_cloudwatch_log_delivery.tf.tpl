# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_log_delivery                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_log_delivery" "this" {

  delivery_destination_arn  = ""     # string | required
  delivery_source_name      = ""     # string | required
  field_delimiter           = ""     # string | optional+computed
  record_fields             = []     # list(string) | optional+computed
  s3_delivery_configuration = []     # list(object({ enable_hive_compatible_path: bool, suffix_path: string })) | optional+computed
  tags                      = {}     # map(string) | optional

  # arn                       = ""     # string | computed
  # id                        = ""     # string | computed
  # tags_all                  = {}     # map(string) | computed

}


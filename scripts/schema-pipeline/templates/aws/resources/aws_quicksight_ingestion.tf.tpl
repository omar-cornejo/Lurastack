# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_quicksight_ingestion                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_quicksight_ingestion" "this" {

  data_set_id      = ""     # string | required
  ingestion_id     = ""     # string | required
  ingestion_type   = ""     # string | required
  aws_account_id   = ""     # string | optional+computed

  # arn              = ""     # string | computed
  # id               = ""     # string | computed
  # ingestion_status = ""     # string | computed

}


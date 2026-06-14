# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_timestreamwrite_database                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_timestreamwrite_database" "this" {

  database_name = ""     # string | required
  id            = ""     # string | optional+computed
  kms_key_id    = ""     # string | optional+computed
  tags          = {}     # map(string) | optional
  tags_all      = {}     # map(string) | optional+computed

  # arn           = ""     # string | computed
  # table_count   = 0      # number | computed

}


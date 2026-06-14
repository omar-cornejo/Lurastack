# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_timestreamwrite_database                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_timestreamwrite_database" "this" {

  name              = ""     # string | required

  # arn               = ""     # string | computed
  # created_time      = ""     # string | computed
  # kms_key_id        = ""     # string | computed
  # last_updated_time = ""     # string | computed
  # table_count       = 0      # number | computed

}


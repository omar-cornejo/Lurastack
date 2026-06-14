# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3tables_table_bucket_policy                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3tables_table_bucket_policy" "this" {

  resource_policy  = ""     # string | required
  table_bucket_arn = ""     # string | required

}


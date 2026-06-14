# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3tables_table_policy                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3tables_table_policy" "this" {

  name             = ""     # string | required
  namespace        = ""     # string | required
  resource_policy  = ""     # string | required
  table_bucket_arn = ""     # string | required

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appfabric_ingestion                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appfabric_ingestion" "this" {

  app            = ""     # string | required
  app_bundle_arn = ""     # string | required
  ingestion_type = ""     # string | required
  tenant_id      = ""     # string | required
  tags           = {}     # map(string) | optional

  # arn            = ""     # string | computed
  # id             = ""     # string | computed
  # tags_all       = {}     # map(string) | computed

}


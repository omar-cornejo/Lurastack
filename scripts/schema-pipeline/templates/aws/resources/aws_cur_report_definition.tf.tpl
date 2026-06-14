# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cur_report_definition                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cur_report_definition" "this" {

  additional_schema_elements = []     # set(string) | required
  compression                = ""     # string | required
  format                     = ""     # string | required
  report_name                = ""     # string | required
  s3_bucket                  = ""     # string | required
  s3_region                  = ""     # string | required
  time_unit                  = ""     # string | required
  additional_artifacts       = []     # set(string) | optional
  id                         = ""     # string | optional+computed
  refresh_closed_reports     = false  # bool | optional
  report_versioning          = ""     # string | optional
  s3_prefix                  = ""     # string | optional
  tags                       = {}     # map(string) | optional
  tags_all                   = {}     # map(string) | optional+computed

  # arn                        = ""     # string | computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cur_report_definition                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_cur_report_definition" "this" {

  report_name                = ""     # string | required
  id                         = ""     # string | optional+computed
  tags                       = {}     # map(string) | optional+computed

  # additional_artifacts       = []     # set(string) | computed
  # additional_schema_elements = []     # set(string) | computed
  # compression                = ""     # string | computed
  # format                     = ""     # string | computed
  # refresh_closed_reports     = false  # bool | computed
  # report_versioning          = ""     # string | computed
  # s3_bucket                  = ""     # string | computed
  # s3_prefix                  = ""     # string | computed
  # s3_region                  = ""     # string | computed
  # time_unit                  = ""     # string | computed

}


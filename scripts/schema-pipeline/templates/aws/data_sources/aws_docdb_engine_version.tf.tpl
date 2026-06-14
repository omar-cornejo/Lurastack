# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_docdb_engine_version                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_docdb_engine_version" "this" {

  engine                             = ""     # string | optional
  id                                 = ""     # string | optional+computed
  parameter_group_family             = ""     # string | optional+computed
  preferred_versions                 = []     # list(string) | optional
  version                            = ""     # string | optional+computed

  # engine_description                 = ""     # string | computed
  # exportable_log_types               = []     # set(string) | computed
  # supports_log_exports_to_cloudwatch = false  # bool | computed
  # valid_upgrade_targets              = []     # set(string) | computed
  # version_description                = ""     # string | computed

}


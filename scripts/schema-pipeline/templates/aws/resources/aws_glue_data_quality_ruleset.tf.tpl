# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_glue_data_quality_ruleset                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_glue_data_quality_ruleset" "this" {

  name                  = ""     # string | required
  ruleset               = ""     # string | required
  description           = ""     # string | optional
  id                    = ""     # string | optional+computed
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed

  # arn                   = ""     # string | computed
  # created_on            = ""     # string | computed
  # last_modified_on      = ""     # string | computed
  # recommendation_run_id = ""     # string | computed

  target_table { # list [0..1]
    database_name = ""     # string | required
    table_name    = ""     # string | required
    catalog_id    = ""     # string | optional

  }

}


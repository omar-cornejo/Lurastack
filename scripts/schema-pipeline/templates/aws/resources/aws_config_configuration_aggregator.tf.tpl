# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_config_configuration_aggregator                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_config_configuration_aggregator" "this" {

  name     = ""     # string | required
  id       = ""     # string | optional+computed
  tags     = {}     # map(string) | optional
  tags_all = {}     # map(string) | optional+computed

  # arn      = ""     # string | computed

  account_aggregation_source { # list [0..1]
    account_ids = []     # list(string) | required
    all_regions = false  # bool | optional
    regions     = []     # list(string) | optional

  }

  organization_aggregation_source { # list [0..1]
    role_arn    = ""     # string | required
    all_regions = false  # bool | optional
    regions     = []     # list(string) | optional

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_securityhub_finding_aggregator                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_securityhub_finding_aggregator" "this" {

  linking_mode      = ""     # string | required
  id                = ""     # string | optional+computed
  specified_regions = []     # set(string) | optional

}


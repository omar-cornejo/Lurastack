# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshift_cluster_snapshot                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshift_cluster_snapshot" "this" {

  cluster_identifier               = ""     # string | required
  snapshot_identifier              = ""     # string | required
  id                               = ""     # string | optional+computed
  manual_snapshot_retention_period = 0      # number | optional
  tags                             = {}     # map(string) | optional
  tags_all                         = {}     # map(string) | optional+computed

  # arn                              = ""     # string | computed
  # kms_key_id                       = ""     # string | computed
  # owner_account                    = ""     # string | computed

}


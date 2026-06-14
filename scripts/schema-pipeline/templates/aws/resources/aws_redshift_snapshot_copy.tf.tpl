# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshift_snapshot_copy                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshift_snapshot_copy" "this" {

  cluster_identifier               = ""     # string | required
  destination_region               = ""     # string | required
  manual_snapshot_retention_period = 0      # number | optional+computed
  retention_period                 = 0      # number | optional+computed
  snapshot_copy_grant_name         = ""     # string | optional

  # id                               = ""     # string | computed

}


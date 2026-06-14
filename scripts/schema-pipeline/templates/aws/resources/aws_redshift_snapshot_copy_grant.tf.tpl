# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshift_snapshot_copy_grant                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshift_snapshot_copy_grant" "this" {

  snapshot_copy_grant_name = ""     # string | required
  id                       = ""     # string | optional+computed
  kms_key_id               = ""     # string | optional+computed
  tags                     = {}     # map(string) | optional
  tags_all                 = {}     # map(string) | optional+computed

  # arn                      = ""     # string | computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshift_snapshot_schedule_association          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshift_snapshot_schedule_association" "this" {

  cluster_identifier  = ""     # string | required
  schedule_identifier = ""     # string | required
  id                  = ""     # string | optional+computed

}


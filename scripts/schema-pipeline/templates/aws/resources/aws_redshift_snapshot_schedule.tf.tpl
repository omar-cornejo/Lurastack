# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshift_snapshot_schedule                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshift_snapshot_schedule" "this" {

  definitions       = []     # set(string) | required
  description       = ""     # string | optional
  force_destroy     = false  # bool | optional
  id                = ""     # string | optional+computed
  identifier        = ""     # string | optional+computed
  identifier_prefix = ""     # string | optional+computed
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed

}


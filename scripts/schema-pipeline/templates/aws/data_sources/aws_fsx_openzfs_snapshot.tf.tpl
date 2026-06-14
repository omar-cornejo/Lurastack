# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_fsx_openzfs_snapshot                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_fsx_openzfs_snapshot" "this" {

  id            = ""     # string | optional+computed
  most_recent   = false  # bool | optional
  name          = ""     # string | optional
  snapshot_ids  = []     # list(string) | optional
  tags          = {}     # map(string) | optional+computed

  # arn           = ""     # string | computed
  # creation_time = ""     # string | computed
  # snapshot_id   = ""     # string | computed
  # volume_id     = ""     # string | computed

  filter { # set
    name   = ""     # string | required
    values = []     # list(string) | required

  }

}


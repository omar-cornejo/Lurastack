# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ebs_snapshot_block_public_access                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ebs_snapshot_block_public_access" "this" {

  state = ""     # string | required
  id    = ""     # string | optional+computed

}


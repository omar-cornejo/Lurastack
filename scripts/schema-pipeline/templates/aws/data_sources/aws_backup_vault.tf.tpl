# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_backup_vault                                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_backup_vault" "this" {

  name            = ""     # string | required
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed
  # kms_key_arn     = ""     # string | computed
  # recovery_points = 0      # number | computed

}


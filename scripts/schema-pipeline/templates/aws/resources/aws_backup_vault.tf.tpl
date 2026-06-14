# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_backup_vault                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_backup_vault" "this" {

  name            = ""     # string | required
  force_destroy   = false  # bool | optional
  id              = ""     # string | optional+computed
  kms_key_arn     = ""     # string | optional+computed
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed
  # recovery_points = 0      # number | computed

  timeouts { # single
    delete = ""     # string | optional

  }

}


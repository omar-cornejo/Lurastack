# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sfn_activity                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sfn_activity" "this" {

  name          = ""     # string | required
  id            = ""     # string | optional+computed
  tags          = {}     # map(string) | optional
  tags_all      = {}     # map(string) | optional+computed

  # creation_date = ""     # string | computed

  encryption_configuration { # list [0..1]
    kms_data_key_reuse_period_seconds = 0      # number | optional
    kms_key_id                        = ""     # string | optional
    type                              = ""     # string | optional

  }

}


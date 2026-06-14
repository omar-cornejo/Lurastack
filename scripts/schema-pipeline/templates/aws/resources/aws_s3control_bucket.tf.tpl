# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3control_bucket                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3control_bucket" "this" {

  bucket                      = ""     # string | required
  outpost_id                  = ""     # string | required
  id                          = ""     # string | optional+computed
  tags                        = {}     # map(string) | optional
  tags_all                    = {}     # map(string) | optional+computed

  # arn                         = ""     # string | computed
  # creation_date               = ""     # string | computed
  # public_access_block_enabled = false  # bool | computed

}


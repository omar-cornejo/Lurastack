# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_connect_vocabulary                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_connect_vocabulary" "this" {

  instance_id        = ""     # string | required
  id                 = ""     # string | optional+computed
  name               = ""     # string | optional+computed
  tags               = {}     # map(string) | optional+computed
  vocabulary_id      = ""     # string | optional+computed

  # arn                = ""     # string | computed
  # content            = ""     # string | computed
  # failure_reason     = ""     # string | computed
  # language_code      = ""     # string | computed
  # last_modified_time = ""     # string | computed
  # state              = ""     # string | computed

}


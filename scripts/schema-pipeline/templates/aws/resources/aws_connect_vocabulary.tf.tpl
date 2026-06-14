# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_connect_vocabulary                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_connect_vocabulary" "this" {

  content            = ""     # string | required
  instance_id        = ""     # string | required
  language_code      = ""     # string | required
  name               = ""     # string | required
  id                 = ""     # string | optional+computed
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed
  # failure_reason     = ""     # string | computed
  # last_modified_time = ""     # string | computed
  # state              = ""     # string | computed
  # vocabulary_id      = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}


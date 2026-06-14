# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_transcribe_vocabulary                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_transcribe_vocabulary" "this" {

  language_code       = ""     # string | required
  vocabulary_name     = ""     # string | required
  id                  = ""     # string | optional+computed
  phrases             = []     # list(string) | optional
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed
  vocabulary_file_uri = ""     # string | optional+computed

  # arn                 = ""     # string | computed
  # download_uri        = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


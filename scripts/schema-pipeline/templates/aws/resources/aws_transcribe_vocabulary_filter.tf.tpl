# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_transcribe_vocabulary_filter                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_transcribe_vocabulary_filter" "this" {

  language_code              = ""     # string | required
  vocabulary_filter_name     = ""     # string | required
  id                         = ""     # string | optional+computed
  tags                       = {}     # map(string) | optional
  tags_all                   = {}     # map(string) | optional+computed
  vocabulary_filter_file_uri = ""     # string | optional
  words                      = []     # list(string) | optional

  # arn                        = ""     # string | computed
  # download_uri               = ""     # string | computed

}


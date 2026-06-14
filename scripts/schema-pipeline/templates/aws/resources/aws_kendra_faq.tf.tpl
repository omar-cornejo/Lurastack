# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_kendra_faq                                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_kendra_faq" "this" {

  index_id      = ""     # string | required
  name          = ""     # string | required
  role_arn      = ""     # string | required
  description   = ""     # string | optional
  file_format   = ""     # string | optional
  id            = ""     # string | optional+computed
  language_code = ""     # string | optional+computed
  tags          = {}     # map(string) | optional
  tags_all      = {}     # map(string) | optional+computed

  # arn           = ""     # string | computed
  # created_at    = ""     # string | computed
  # error_message = ""     # string | computed
  # faq_id        = ""     # string | computed
  # status        = ""     # string | computed
  # updated_at    = ""     # string | computed

  s3_path { # list [1..1]
    bucket = ""     # string | required
    key    = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}


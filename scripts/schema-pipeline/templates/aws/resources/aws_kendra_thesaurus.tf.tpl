# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_kendra_thesaurus                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_kendra_thesaurus" "this" {

  index_id     = ""     # string | required
  name         = ""     # string | required
  role_arn     = ""     # string | required
  description  = ""     # string | optional
  id           = ""     # string | optional+computed
  tags         = {}     # map(string) | optional
  tags_all     = {}     # map(string) | optional+computed

  # arn          = ""     # string | computed
  # status       = ""     # string | computed
  # thesaurus_id = ""     # string | computed

  source_s3_path { # list [1..1]
    bucket = ""     # string | required
    key    = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


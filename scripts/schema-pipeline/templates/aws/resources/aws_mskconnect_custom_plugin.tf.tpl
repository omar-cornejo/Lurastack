# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_mskconnect_custom_plugin                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_mskconnect_custom_plugin" "this" {

  content_type    = ""     # string | required
  name            = ""     # string | required
  description     = ""     # string | optional
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed
  # latest_revision = 0      # number | computed
  # state           = ""     # string | computed

  location { # list [1..1]

    s3 { # list [1..1]
      bucket_arn     = ""     # string | required
      file_key       = ""     # string | required
      object_version = ""     # string | optional

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3control_bucket_lifecycle_configuration        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3control_bucket_lifecycle_configuration" "this" {

  bucket = ""     # string | required
  id     = ""     # string | optional+computed

  rule { # set [1..*]
    id     = ""     # string | required
    status = ""     # string | optional

    abort_incomplete_multipart_upload { # list [0..1]
      days_after_initiation = 0      # number | required

    }

    expiration { # list [0..1]
      date                         = ""     # string | optional
      days                         = 0      # number | optional
      expired_object_delete_marker = false  # bool | optional

    }

    filter { # list [0..1]
      prefix = ""     # string | optional
      tags   = {}     # map(string) | optional

    }

  }

}


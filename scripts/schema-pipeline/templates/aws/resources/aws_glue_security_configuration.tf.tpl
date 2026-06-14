# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_glue_security_configuration                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_glue_security_configuration" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed

  encryption_configuration { # list [1..1]

    cloudwatch_encryption { # list [1..1]
      cloudwatch_encryption_mode = ""     # string | optional
      kms_key_arn                = ""     # string | optional

    }

    job_bookmarks_encryption { # list [1..1]
      job_bookmarks_encryption_mode = ""     # string | optional
      kms_key_arn                   = ""     # string | optional

    }

    s3_encryption { # list [1..1]
      kms_key_arn        = ""     # string | optional
      s3_encryption_mode = ""     # string | optional

    }

  }

}


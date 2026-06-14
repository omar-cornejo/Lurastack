# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_bucket_logging                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_bucket_logging" "this" {

  bucket                = ""     # string | required
  target_bucket         = ""     # string | required
  target_prefix         = ""     # string | required
  expected_bucket_owner = ""     # string | optional
  id                    = ""     # string | optional+computed

  target_grant { # set
    permission = ""     # string | required

    grantee { # list [1..1]
      type          = ""     # string | required
      email_address = ""     # string | optional
      id            = ""     # string | optional
      uri           = ""     # string | optional

      # display_name  = ""     # string | computed

    }

  }

  target_object_key_format { # list [0..1]

    partitioned_prefix { # list [0..1]
      partition_date_source = ""     # string | required

    }

    simple_prefix {} # list [0..1]

  }

}


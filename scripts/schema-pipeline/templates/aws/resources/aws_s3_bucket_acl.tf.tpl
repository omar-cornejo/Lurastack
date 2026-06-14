# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_bucket_acl                                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_bucket_acl" "this" {

  bucket                = ""     # string | required
  acl                   = ""     # string | optional
  expected_bucket_owner = ""     # string | optional
  id                    = ""     # string | optional+computed

  access_control_policy { # list [0..1]

    grant { # set
      permission = ""     # string | required

      grantee { # list [0..1]
        type          = ""     # string | required
        email_address = ""     # string | optional
        id            = ""     # string | optional
        uri           = ""     # string | optional

        # display_name  = ""     # string | computed

      }

    }

    owner { # list [1..1]
      id           = ""     # string | required
      display_name = ""     # string | optional+computed

    }

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_athena_database                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_athena_database" "this" {

  name                  = ""     # string | required
  bucket                = ""     # string | optional
  comment               = ""     # string | optional
  expected_bucket_owner = ""     # string | optional
  force_destroy         = false  # bool | optional
  id                    = ""     # string | optional+computed
  properties            = {}     # map(string) | optional

  acl_configuration { # list [0..1]
    s3_acl_option = ""     # string | required

  }

  encryption_configuration { # list [0..1]
    encryption_option = ""     # string | required
    kms_key           = ""     # string | optional

  }

}


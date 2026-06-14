# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_bucket_inventory                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_bucket_inventory" "this" {

  bucket                   = ""     # string | required
  included_object_versions = ""     # string | required
  name                     = ""     # string | required
  enabled                  = false  # bool | optional
  id                       = ""     # string | optional+computed
  optional_fields          = []     # set(string) | optional

  destination { # list [1..1]

    bucket { # list [1..1]
      bucket_arn = ""     # string | required
      format     = ""     # string | required
      account_id = ""     # string | optional
      prefix     = ""     # string | optional

      encryption { # list [0..1]

        sse_kms { # list [0..1]
          key_id = ""     # string | required

        }

        sse_s3 {} # list [0..1]

      }

    }

  }

  filter { # list [0..1]
    prefix = ""     # string | optional

  }

  schedule { # list [1..1]
    frequency = ""     # string | required

  }

}


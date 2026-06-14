# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_bucket_analytics_configuration               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_bucket_analytics_configuration" "this" {

  bucket = ""     # string | required
  name   = ""     # string | required
  id     = ""     # string | optional+computed

  filter { # list [0..1]
    prefix = ""     # string | optional
    tags   = {}     # map(string) | optional

  }

  storage_class_analysis { # list [0..1]

    data_export { # list [1..1]
      output_schema_version = ""     # string | optional

      destination { # list [1..1]

        s3_bucket_destination { # list [1..1]
          bucket_arn        = ""     # string | required
          bucket_account_id = ""     # string | optional
          format            = ""     # string | optional
          prefix            = ""     # string | optional

        }

      }

    }

  }

}


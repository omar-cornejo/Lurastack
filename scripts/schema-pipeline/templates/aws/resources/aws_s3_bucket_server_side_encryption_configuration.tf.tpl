# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_bucket_server_side_encryption_configuration  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {

  bucket                = ""     # string | required
  expected_bucket_owner = ""     # string | optional
  id                    = ""     # string | optional+computed

  rule { # set [1..*]
    bucket_key_enabled = false  # bool | optional

    apply_server_side_encryption_by_default { # list [0..1]
      sse_algorithm     = ""     # string | required
      kms_master_key_id = ""     # string | optional

    }

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_macie2_classification_export_configuration      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_macie2_classification_export_configuration" "this" {

  id = ""     # string | optional+computed

  s3_destination { # list [0..1]
    bucket_name = ""     # string | required
    kms_key_arn = ""     # string | required
    key_prefix  = ""     # string | optional

  }

}


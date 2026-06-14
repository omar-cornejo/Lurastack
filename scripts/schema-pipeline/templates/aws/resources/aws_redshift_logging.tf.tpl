# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshift_logging                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshift_logging" "this" {

  cluster_identifier   = ""     # string | required
  bucket_name          = ""     # string | optional
  log_destination_type = ""     # string | optional
  log_exports          = []     # set(string) | optional
  s3_key_prefix        = ""     # string | optional

  # id                   = ""     # string | computed

}


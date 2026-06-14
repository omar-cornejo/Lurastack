# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_bucket_request_payment_configuration         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_bucket_request_payment_configuration" "this" {

  bucket                = ""     # string | required
  payer                 = ""     # string | required
  expected_bucket_owner = ""     # string | optional
  id                    = ""     # string | optional+computed

}


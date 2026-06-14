# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lightsail_bucket_access_key                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lightsail_bucket_access_key" "this" {

  bucket_name       = ""     # string | required
  id                = ""     # string | optional+computed

  # access_key_id     = ""     # string | computed
  # created_at        = ""     # string | computed
  # secret_access_key = ""     # string | computed
  # status            = ""     # string | computed

}


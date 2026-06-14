# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lightsail_bucket_resource_access                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lightsail_bucket_resource_access" "this" {

  bucket_name   = ""     # string | required
  resource_name = ""     # string | required
  id            = ""     # string | optional+computed

}


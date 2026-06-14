# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_media_store_container_policy                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_media_store_container_policy" "this" {

  container_name = ""     # string | required
  policy         = ""     # string | required
  id             = ""     # string | optional+computed

}


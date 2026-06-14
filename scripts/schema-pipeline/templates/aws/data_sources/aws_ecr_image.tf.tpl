# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ecr_image                                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_ecr_image" "this" {

  repository_name     = ""     # string | required
  id                  = ""     # string | optional+computed
  image_digest        = ""     # string | optional+computed
  image_tag           = ""     # string | optional
  most_recent         = false  # bool | optional
  registry_id         = ""     # string | optional+computed

  # image_pushed_at     = 0      # number | computed
  # image_size_in_bytes = 0      # number | computed
  # image_tags          = []     # list(string) | computed
  # image_uri           = ""     # string | computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lightsail_disk_attachment                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lightsail_disk_attachment" "this" {

  disk_name     = ""     # string | required
  disk_path     = ""     # string | required
  instance_name = ""     # string | required
  id            = ""     # string | optional+computed

}


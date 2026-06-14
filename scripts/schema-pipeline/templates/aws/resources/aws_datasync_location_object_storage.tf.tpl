# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datasync_location_object_storage                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datasync_location_object_storage" "this" {

  agent_arns         = []     # set(string) | required
  bucket_name        = ""     # string | required
  server_hostname    = ""     # string | required
  access_key         = ""     # string | optional
  id                 = ""     # string | optional+computed
  secret_key         = ""     # string | optional+sensitive
  server_certificate = ""     # string | optional
  server_port        = 0      # number | optional
  server_protocol    = ""     # string | optional
  subdirectory       = ""     # string | optional+computed
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed
  # uri                = ""     # string | computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_connect_contact_flow                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_connect_contact_flow" "this" {

  instance_id     = ""     # string | required
  name            = ""     # string | required
  content         = ""     # string | optional+computed
  content_hash    = ""     # string | optional
  description     = ""     # string | optional
  filename        = ""     # string | optional
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed
  type            = ""     # string | optional

  # arn             = ""     # string | computed
  # contact_flow_id = ""     # string | computed

}


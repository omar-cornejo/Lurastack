# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_connect_contact_flow_module                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_connect_contact_flow_module" "this" {

  instance_id            = ""     # string | required
  name                   = ""     # string | required
  content                = ""     # string | optional+computed
  content_hash           = ""     # string | optional
  description            = ""     # string | optional
  filename               = ""     # string | optional
  id                     = ""     # string | optional+computed
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed
  # contact_flow_module_id = ""     # string | computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lightsail_domain_entry                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lightsail_domain_entry" "this" {

  domain_name = ""     # string | required
  name        = ""     # string | required
  target      = ""     # string | required
  type        = ""     # string | required
  id          = ""     # string | optional+computed
  is_alias    = false  # bool | optional

}


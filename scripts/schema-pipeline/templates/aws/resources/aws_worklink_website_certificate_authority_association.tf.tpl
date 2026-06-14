# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_worklink_website_certificate_authority_association  │
# └──────────────────────────────────────────────────────────────┘
# ⚠ DEPRECATED: this resource type is deprecated
resource "aws_worklink_website_certificate_authority_association" "this" {

  certificate   = ""     # string | required
  fleet_arn     = ""     # string | required
  display_name  = ""     # string | optional
  id            = ""     # string | optional+computed

  # website_ca_id = ""     # string | computed

}


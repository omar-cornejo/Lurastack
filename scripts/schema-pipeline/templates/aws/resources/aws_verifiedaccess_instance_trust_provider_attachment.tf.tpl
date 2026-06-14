# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_verifiedaccess_instance_trust_provider_attachment  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_verifiedaccess_instance_trust_provider_attachment" "this" {

  verifiedaccess_instance_id       = ""     # string | required
  verifiedaccess_trust_provider_id = ""     # string | required
  id                               = ""     # string | optional+computed

}


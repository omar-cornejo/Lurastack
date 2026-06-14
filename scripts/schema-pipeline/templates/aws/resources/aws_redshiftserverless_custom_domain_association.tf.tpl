# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshiftserverless_custom_domain_association    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshiftserverless_custom_domain_association" "this" {

  custom_domain_certificate_arn         = ""     # string | required
  custom_domain_name                    = ""     # string | required
  workgroup_name                        = ""     # string | required

  # custom_domain_certificate_expiry_time = ""     # string | computed
  # id                                    = ""     # string | computed

}


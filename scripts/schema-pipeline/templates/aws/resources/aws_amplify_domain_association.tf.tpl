# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_amplify_domain_association                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_amplify_domain_association" "this" {

  app_id                              = ""     # string | required
  domain_name                         = ""     # string | required
  enable_auto_sub_domain              = false  # bool | optional
  id                                  = ""     # string | optional+computed
  wait_for_verification               = false  # bool | optional

  # arn                                 = ""     # string | computed
  # certificate_verification_dns_record = ""     # string | computed

  certificate_settings { # list [0..1]
    type                                = ""     # string | required
    custom_certificate_arn              = ""     # string | optional

    # certificate_verification_dns_record = ""     # string | computed

  }

  sub_domain { # set [1..*]
    branch_name = ""     # string | required
    prefix      = ""     # string | required

    # dns_record  = ""     # string | computed
    # verified    = false  # bool | computed

  }

}


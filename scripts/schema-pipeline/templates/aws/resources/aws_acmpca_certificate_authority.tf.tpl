# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_acmpca_certificate_authority                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_acmpca_certificate_authority" "this" {

  enabled                         = false  # bool | optional
  id                              = ""     # string | optional+computed
  key_storage_security_standard   = ""     # string | optional+computed
  permanent_deletion_time_in_days = 0      # number | optional
  tags                            = {}     # map(string) | optional
  tags_all                        = {}     # map(string) | optional+computed
  type                            = ""     # string | optional
  usage_mode                      = ""     # string | optional+computed

  # arn                             = ""     # string | computed
  # certificate                     = ""     # string | computed
  # certificate_chain               = ""     # string | computed
  # certificate_signing_request     = ""     # string | computed
  # not_after                       = ""     # string | computed
  # not_before                      = ""     # string | computed
  # serial                          = ""     # string | computed

  certificate_authority_configuration { # list [1..1]
    key_algorithm     = ""     # string | required
    signing_algorithm = ""     # string | required

    subject { # list [1..1]
      common_name                  = ""     # string | optional
      country                      = ""     # string | optional
      distinguished_name_qualifier = ""     # string | optional
      generation_qualifier         = ""     # string | optional
      given_name                   = ""     # string | optional
      initials                     = ""     # string | optional
      locality                     = ""     # string | optional
      organization                 = ""     # string | optional
      organizational_unit          = ""     # string | optional
      pseudonym                    = ""     # string | optional
      state                        = ""     # string | optional
      surname                      = ""     # string | optional
      title                        = ""     # string | optional

    }

  }

  revocation_configuration { # list [0..1]

    crl_configuration { # list [0..1]
      custom_cname       = ""     # string | optional
      enabled            = false  # bool | optional
      expiration_in_days = 0      # number | optional
      s3_bucket_name     = ""     # string | optional
      s3_object_acl      = ""     # string | optional+computed

    }

    ocsp_configuration { # list [0..1]
      enabled           = false  # bool | required
      ocsp_custom_cname = ""     # string | optional

    }

  }

  timeouts { # single
    create = ""     # string | optional

  }

}


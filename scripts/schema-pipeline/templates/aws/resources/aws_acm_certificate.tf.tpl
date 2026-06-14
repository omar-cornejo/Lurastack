# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_acm_certificate                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_acm_certificate" "this" {

  certificate_authority_arn = ""     # string | optional
  certificate_body          = ""     # string | optional
  certificate_chain         = ""     # string | optional
  domain_name               = ""     # string | optional+computed
  early_renewal_duration    = ""     # string | optional
  id                        = ""     # string | optional+computed
  key_algorithm             = ""     # string | optional+computed
  private_key               = ""     # string | optional+sensitive
  subject_alternative_names = []     # set(string) | optional+computed
  tags                      = {}     # map(string) | optional
  tags_all                  = {}     # map(string) | optional+computed
  validation_method         = ""     # string | optional+computed

  # arn                       = ""     # string | computed
  # domain_validation_options = [  # set(object)
  #   {
  #     domain_name = ""
  #     resource_record_name = ""
  #     resource_record_type = ""
  #     resource_record_value = ""
  #   }
  # ]
  # not_after                 = ""     # string | computed
  # not_before                = ""     # string | computed
  # pending_renewal           = false  # bool | computed
  # renewal_eligibility       = ""     # string | computed
  # renewal_summary = [  # list(object)
  #   {
  #     renewal_status = ""
  #     renewal_status_reason = ""
  #     updated_at = ""
  #   }
  # ]
  # status                    = ""     # string | computed
  # type                      = ""     # string | computed
  # validation_emails         = []     # list(string) | computed

  options { # list [0..1]
    certificate_transparency_logging_preference = ""     # string | optional

  }

  validation_option { # set
    domain_name       = ""     # string | required
    validation_domain = ""     # string | required

  }

}


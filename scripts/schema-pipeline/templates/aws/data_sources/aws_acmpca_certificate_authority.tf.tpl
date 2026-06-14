# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_acmpca_certificate_authority                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_acmpca_certificate_authority" "this" {

  arn                           = ""     # string | required
  id                            = ""     # string | optional+computed
  tags                          = {}     # map(string) | optional+computed

  # certificate                   = ""     # string | computed
  # certificate_chain             = ""     # string | computed
  # certificate_signing_request   = ""     # string | computed
  # key_storage_security_standard = ""     # string | computed
  # not_after                     = ""     # string | computed
  # not_before                    = ""     # string | computed
  # revocation_configuration = [  # list(object)
  #   {
  #     crl_configuration = [  # list(object)
  #       {
  #         custom_cname = ""
  #         enabled = false
  #         expiration_in_days = 0
  #         s3_bucket_name = ""
  #         s3_object_acl = ""
  #       }
  #     ]
  #     ocsp_configuration = [  # list(object)
  #       {
  #         enabled = false
  #         ocsp_custom_cname = ""
  #       }
  #     ]
  #   }
  # ]
  # serial                        = ""     # string | computed
  # status                        = ""     # string | computed
  # type                          = ""     # string | computed
  # usage_mode                    = ""     # string | computed

}


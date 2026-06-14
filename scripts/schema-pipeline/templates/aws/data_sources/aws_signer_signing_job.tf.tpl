# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_signer_signing_job                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_signer_signing_job" "this" {

  job_id                = ""     # string | required
  id                    = ""     # string | optional+computed

  # completed_at          = ""     # string | computed
  # created_at            = ""     # string | computed
  # job_invoker           = ""     # string | computed
  # job_owner             = ""     # string | computed
  # platform_display_name = ""     # string | computed
  # platform_id           = ""     # string | computed
  # profile_name          = ""     # string | computed
  # profile_version       = ""     # string | computed
  # requested_by          = ""     # string | computed
  # revocation_record = [  # list(object)
  #   {
  #     reason = ""
  #     revoked_at = ""
  #     revoked_by = ""
  #   }
  # ]
  # signature_expires_at  = ""     # string | computed
  # signed_object = [  # list(object)
  #   {
  #     s3 = [  # list(object)
  #       {
  #         bucket = ""
  #         key = ""
  #       }
  #     ]
  #   }
  # ]
  # source = [  # list(object)
  #   {
  #     s3 = [  # list(object)
  #       {
  #         bucket = ""
  #         key = ""
  #         version = ""
  #       }
  #     ]
  #   }
  # ]
  # status                = ""     # string | computed
  # status_reason         = ""     # string | computed

}


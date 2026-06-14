# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_signer_signing_job                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_signer_signing_job" "this" {

  profile_name               = ""     # string | required
  id                         = ""     # string | optional+computed
  ignore_signing_job_failure = false  # bool | optional

  # completed_at               = ""     # string | computed
  # created_at                 = ""     # string | computed
  # job_id                     = ""     # string | computed
  # job_invoker                = ""     # string | computed
  # job_owner                  = ""     # string | computed
  # platform_display_name      = ""     # string | computed
  # platform_id                = ""     # string | computed
  # profile_version            = ""     # string | computed
  # requested_by               = ""     # string | computed
  # revocation_record = [  # list(object)
  #   {
  #     reason = ""
  #     revoked_at = ""
  #     revoked_by = ""
  #   }
  # ]
  # signature_expires_at       = ""     # string | computed
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
  # status                     = ""     # string | computed
  # status_reason              = ""     # string | computed

  destination { # list [1..1]

    s3 { # list [1..1]
      bucket = ""     # string | required
      prefix = ""     # string | optional

    }

  }

  source { # list [1..1]

    s3 { # list [1..1]
      bucket  = ""     # string | required
      key     = ""     # string | required
      version = ""     # string | required

    }

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_kms_key_ring_import_job                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_kms_key_ring_import_job" "this" {

  import_job_id    = ""     # string | required | It must be unique within a KeyRing and match the regular exp…
  import_method    = ""     # string | required | The wrapping method to be used for incoming key material. Po…
  key_ring         = ""     # string | required | The KeyRing that this import job belongs to. Format: ''proje…
  protection_level = ""     # string | required | The protection level of the ImportJob. This must match the p…
  id               = ""     # string | optional+computed

  # attestation = [  # list(object)
  #   {
  #     content = ""
  #     format = ""
  #   }
  # ]
  # expire_time      = ""     # string | computed | The time at which this resource is scheduled for expiration …
  # name             = ""     # string | computed | The resource name for this ImportJob in the format projects/…
  # public_key = [  # list(object)
  #   {
  #     pem = ""
  #   }
  # ]
  # state            = ""     # string | computed | The current state of the ImportJob, indicating if it can be …

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}


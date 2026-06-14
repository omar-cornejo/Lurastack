# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_region_commitment                    │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_region_commitment" "this" {

  name               = ""     # string | required | Name of the resource. The name must be 1-63 characters long …
  plan               = ""     # string | required | The plan for this commitment, which determines duration and …
  auto_renew         = false  # bool | optional+computed | Specifies whether to enable automatic renewal for the commit…
  category           = ""     # string | optional+computed | The category of the commitment. Category MACHINE specifies c…
  description        = ""     # string | optional | An optional description of this resource.
  id                 = ""     # string | optional+computed
  project            = ""     # string | optional+computed
  region             = ""     # string | optional+computed | URL of the region where this commitment may be used.
  type               = ""     # string | optional+computed | The type of commitment, which affects the discount rate and …

  # commitment_id      = 0      # number | computed | Unique identifier for the resource.
  # creation_timestamp = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # end_timestamp      = ""     # string | computed | Commitment end time in RFC3339 text format.
  # self_link          = ""     # string | computed
  # start_timestamp    = ""     # string | computed | Commitment start time in RFC3339 text format.
  # status             = ""     # string | computed | Status of the commitment with regards to eventual expiration…
  # status_message     = ""     # string | computed | A human-readable explanation of the status.

  license_resource { # list [0..1]
    license           = ""     # string | required | Any applicable license URI.
    amount            = ""     # string | optional | The number of licenses purchased.
    cores_per_license = ""     # string | optional | Specifies the core range of the instance for which this lice…

  }

  resources { # list
    accelerator_type = ""     # string | optional | Name of the accelerator type resource. Applicable only when …
    amount           = ""     # string | optional | The amount of the resource purchased (in a type-dependent un…
    type             = ""     # string | optional | Type of resource for which this commitment applies. Possible…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_looker_instance                              │
# └──────────────────────────────────────────────────────────────┘
resource "google_looker_instance" "this" {

  name               = ""     # string | required | The ID of the instance or a fully qualified identifier for t…
  consumer_network   = ""     # string | optional | Network name in the consumer project in the format of: proje…
  id                 = ""     # string | optional+computed
  platform_edition   = ""     # string | optional | Platform editions for a Looker instance. Each edition maps t…
  private_ip_enabled = false  # bool | optional | Whether private IP is enabled on the Looker instance.
  project            = ""     # string | optional+computed
  public_ip_enabled  = false  # bool | optional | Whether public IP is enabled on the Looker instance.
  region             = ""     # string | optional+computed | The name of the Looker region of the instance.
  reserved_range     = ""     # string | optional | Name of a reserved IP address range within the consumer netw…

  # create_time        = ""     # string | computed | The time the instance was created in RFC3339 UTC "Zulu" form…
  # egress_public_ip   = ""     # string | computed | Public Egress IP (IPv4).
  # ingress_private_ip = ""     # string | computed | Private Ingress IP (IPv4).
  # ingress_public_ip  = ""     # string | computed | Public Ingress IP (IPv4).
  # looker_uri         = ""     # string | computed | Looker instance URI which can be used to access the Looker I…
  # looker_version     = ""     # string | computed | The Looker version that the instance is using.
  # update_time        = ""     # string | computed | The time the instance was updated in RFC3339 UTC "Zulu" form…

  admin_settings { # list [0..1]
    allowed_email_domains = []     # list(string) | optional | Email domain allowlist for the instance.  Define the email d…

  }

  custom_domain { # list [0..1]
    domain = ""     # string | optional | Domain name

    # state  = ""     # string | computed | Status of the custom domain.

  }

  deny_maintenance_period { # list [0..1]

    end_date { # list [1..1]
      day   = 0      # number | optional | Day of a month. Must be from 1 to 31 and valid for the year …
      month = 0      # number | optional | Month of a year. Must be from 1 to 12, or 0 to specify a yea…
      year  = 0      # number | optional | Year of the date. Must be from 1 to 9999, or 0 to specify a …

    }

    start_date { # list [1..1]
      day   = 0      # number | optional | Day of a month. Must be from 1 to 31 and valid for the year …
      month = 0      # number | optional | Month of a year. Must be from 1 to 12, or 0 to specify a yea…
      year  = 0      # number | optional | Year of the date. Must be from 1 to 9999, or 0 to specify a …

    }

    time { # list [1..1]
      hours   = 0      # number | optional | Hours of day in 24 hour format. Should be from 0 to 23.
      minutes = 0      # number | optional | Minutes of hour of day. Must be from 0 to 59.
      nanos   = 0      # number | optional | Fractions of seconds in nanoseconds. Must be from 0 to 999,9…
      seconds = 0      # number | optional | Seconds of minutes of the time. Must normally be from 0 to 5…

    }

  }

  encryption_config { # list [0..1]
    kms_key_name         = ""     # string | optional | Name of the customer managed encryption key (CMEK) in KMS.

    # kms_key_name_version = ""     # string | computed | Full name and version of the CMEK key currently in use to en…
    # kms_key_state        = ""     # string | computed | Status of the customer managed encryption key (CMEK) in KMS.

  }

  maintenance_window { # list [0..1]
    day_of_week = ""     # string | required | Required. Day of the week for this MaintenanceWindow (in UTC…

    start_time { # list [1..1]
      hours   = 0      # number | optional | Hours of day in 24 hour format. Should be from 0 to 23.
      minutes = 0      # number | optional | Minutes of hour of day. Must be from 0 to 59.
      nanos   = 0      # number | optional | Fractions of seconds in nanoseconds. Must be from 0 to 999,9…
      seconds = 0      # number | optional | Seconds of minutes of the time. Must normally be from 0 to 5…

    }

  }

  oauth_config { # list [0..1]
    client_id     = ""     # string | required | The client ID for the Oauth config.
    client_secret = ""     # string | required | The client secret for the Oauth config.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  user_metadata { # list [0..1]
    additional_developer_user_count = 0      # number | optional | Number of additional Developer Users to allocate to the Look…
    additional_standard_user_count  = 0      # number | optional | Number of additional Standard Users to allocate to the Looke…
    additional_viewer_user_count    = 0      # number | optional | Number of additional Viewer Users to allocate to the Looker …

  }

}


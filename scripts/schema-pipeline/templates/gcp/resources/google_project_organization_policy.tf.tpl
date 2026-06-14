# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_project_organization_policy                  │
# └──────────────────────────────────────────────────────────────┘
resource "google_project_organization_policy" "this" {

  constraint  = ""     # string | required | The name of the Constraint the Policy is configuring, for ex…
  project     = ""     # string | required | The project ID.
  id          = ""     # string | optional+computed
  version     = 0      # number | optional+computed | Version of the Policy. Default version is 0.

  # etag        = ""     # string | computed | The etag of the organization policy. etag is used for optimi…
  # update_time = ""     # string | computed | The timestamp in RFC3339 UTC "Zulu" format, accurate to nano…

  boolean_policy { # list [0..1]
    enforced = false  # bool | required | If true, then the Policy is enforced. If false, then any con…

  }

  list_policy { # list [0..1]
    inherit_from_parent = false  # bool | optional | If set to true, the values from the effective Policy of the …
    suggested_value     = ""     # string | optional+computed | The Google Cloud Console will try to default to a configurat…

    allow { # list [0..1]
      all    = false  # bool | optional | The policy allows or denies all values.
      values = []     # set(string) | optional | The policy can define specific values that are allowed or de…

    }

    deny { # list [0..1]
      all    = false  # bool | optional | The policy allows or denies all values.
      values = []     # set(string) | optional | The policy can define specific values that are allowed or de…

    }

  }

  restore_policy { # list [0..1]
    default = false  # bool | required | May only be set to true. If set, then the default Policy is …

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional
    update = ""     # string | optional

  }

}


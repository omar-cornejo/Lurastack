# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_iam_workforce_pool                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_iam_workforce_pool" "this" {

  location          = ""     # string | required | The location for the resource.
  parent            = ""     # string | required | Immutable. The resource name of the parent. Format: 'organiz…
  workforce_pool_id = ""     # string | required | The name of the pool. The ID must be a globally unique strin…
  description       = ""     # string | optional | A user-specified description of the pool. Cannot exceed 256 …
  disabled          = false  # bool | optional | Whether the pool is disabled. You cannot use a disabled pool…
  display_name      = ""     # string | optional | A user-specified display name of the pool in Google Cloud Co…
  id                = ""     # string | optional+computed
  session_duration  = ""     # string | optional | Duration that the Google Cloud access tokens, console sign-i…

  # name              = ""     # string | computed | Output only. The resource name of the pool. Format: 'locatio…
  # state             = ""     # string | computed | Output only. The state of the pool.  * STATE_UNSPECIFIED: St…

  access_restrictions { # list [0..1]
    disable_programmatic_signin = false  # bool | optional | Disable programmatic sign-in by disabling token issue via th…

    allowed_services { # list
      domain = ""     # string | optional | Domain name of the service. Example: console.cloud.google

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


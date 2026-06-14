# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_identity_platform_config                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_identity_platform_config" "this" {

  authorized_domains         = []     # list(string) | optional+computed | List of domains authorized for OAuth redirects.
  autodelete_anonymous_users = false  # bool | optional | Whether anonymous users will be auto-deleted after a period …
  id                         = ""     # string | optional+computed
  project                    = ""     # string | optional+computed

  # name                       = ""     # string | computed | The name of the Config resource

  blocking_functions { # list [0..1]

    forward_inbound_credentials { # list [0..1]
      access_token  = false  # bool | optional | Whether to pass the user's OAuth identity provider's access …
      id_token      = false  # bool | optional | Whether to pass the user's OIDC identity provider's ID token…
      refresh_token = false  # bool | optional | Whether to pass the user's OAuth identity provider's refresh…

    }

    triggers { # set [1..*]
      event_type   = ""     # string | required
      function_uri = ""     # string | required | HTTP URI trigger for the Cloud Function.

      # update_time  = ""     # string | computed | When the trigger was changed.

    }

  }

  client { # list [0..1]

    # api_key            = ""     # string | computed+sensitive | API key that can be used when making requests for this proje…
    # firebase_subdomain = ""     # string | computed | Firebase subdomain.

    permissions { # list [0..1]
      disabled_user_deletion = false  # bool | optional | When true, end users cannot delete their account on the asso…
      disabled_user_signup   = false  # bool | optional | When true, end users cannot sign up for a new account on the…

    }

  }

  mfa { # list [0..1]
    enabled_providers = []     # list(string) | optional | A list of usable second factors for this project. Possible v…
    state             = ""     # string | optional+computed | Whether MultiFactor Authentication has been enabled for this…

    provider_configs { # list
      state = ""     # string | optional+computed | Whether MultiFactor Authentication has been enabled for this…

      totp_provider_config { # list [0..1]
        adjacent_intervals = 0      # number | optional | The allowed number of adjacent intervals that will be used f…

      }

    }

  }

  monitoring { # list [0..1]

    request_logging { # list [0..1]
      enabled = false  # bool | optional | Whether logging is enabled for this project or not.

    }

  }

  multi_tenant { # list [0..1]
    allow_tenants           = false  # bool | optional | Whether this project can have tenants or not.
    default_tenant_location = ""     # string | optional | The default cloud parent org or folder that the tenant proje…

  }

  quota { # list [0..1]

    sign_up_quota_config { # list [0..1]
      quota          = 0      # number | optional | A sign up APIs quota that customers can override temporarily…
      quota_duration = ""     # string | optional | How long this quota will be active for. It is measurred in s…
      start_time     = ""     # string | optional | When this quota will take affect.

    }

  }

  sign_in { # list [0..1]
    allow_duplicate_emails = false  # bool | optional | Whether to allow more than one account to have the same emai…

    # hash_config = [  # list(object)
    #   {
    #     algorithm = ""
    #     memory_cost = 0
    #     rounds = 0
    #     salt_separator = ""
    #     signer_key = ""
    #   }
    # ]

    anonymous { # list [0..1]
      enabled = false  # bool | required | Whether anonymous user auth is enabled for the project or no…

    }

    email { # list [0..1]
      enabled           = false  # bool | required | Whether email auth is enabled for the project or not.
      password_required = false  # bool | optional | Whether a password is required for email auth or not. If tru…

    }

    phone_number { # list [0..1]
      enabled            = false  # bool | required | Whether phone number auth is enabled for the project or not.
      test_phone_numbers = {}     # map(string) | optional | A map of <test phone number, fake code> that can be used for…

    }

  }

  sms_region_config { # list [0..1]

    allow_by_default { # list [0..1]
      disallowed_regions = []     # list(string) | optional | Two letter unicode region codes to disallow as defined by ht…

    }

    allowlist_only { # list [0..1]
      allowed_regions = []     # list(string) | optional | Two letter unicode region codes to allow as defined by https…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_apikeys_key                                  │
# └──────────────────────────────────────────────────────────────┘
resource "google_apikeys_key" "this" {

  name         = ""     # string | required | The resource name of the key. The name must be unique within…
  display_name = ""     # string | optional | Human-readable display name of this API key. Modifiable by u…
  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed | The project for the resource

  # key_string   = ""     # string | computed+sensitive | Output only. An encrypted and signed value held by this key.…
  # uid          = ""     # string | computed | Output only. Unique id in UUID4 format.

  restrictions { # list [0..1]

    android_key_restrictions { # list [0..1]

      allowed_applications { # list [1..*]
        package_name     = ""     # string | required | The package name of the application.
        sha1_fingerprint = ""     # string | required | The SHA1 fingerprint of the application. For example, both s…

      }

    }

    api_targets { # list
      service = ""     # string | required | The service for this restriction. It should be the canonical…
      methods = []     # list(string) | optional | Optional. List of one or more methods that can be called. If…

    }

    browser_key_restrictions { # list [0..1]
      allowed_referrers = []     # list(string) | required | A list of regular expressions for the referrer URLs that are…

    }

    ios_key_restrictions { # list [0..1]
      allowed_bundle_ids = []     # list(string) | required | A list of bundle IDs that are allowed when making API calls …

    }

    server_key_restrictions { # list [0..1]
      allowed_ips = []     # list(string) | required | A list of the caller IP addresses that are allowed to make A…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


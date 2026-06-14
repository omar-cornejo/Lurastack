# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_identity_platform_project_default_config     │
# └──────────────────────────────────────────────────────────────┘
# ⚠ DEPRECATED: this resource type is deprecated
resource "google_identity_platform_project_default_config" "this" {

  id      = ""     # string | optional+computed
  project = ""     # string | optional+computed

  # name    = ""     # string | computed | The name of the Config resource. Example: "projects/my-aweso…

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
      enabled           = false  # bool | optional | Whether email auth is enabled for the project or not.
      password_required = false  # bool | optional | Whether a password is required for email auth or not. If tru…

    }

    phone_number { # list [0..1]
      enabled            = false  # bool | optional | Whether phone number auth is enabled for the project or not.
      test_phone_numbers = {}     # map(string) | optional | A map of <test phone number, fake code> that can be used for…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


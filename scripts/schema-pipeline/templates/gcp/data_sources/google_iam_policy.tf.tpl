# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_iam_policy                                       │
# └──────────────────────────────────────────────────────────────┘
data "google_iam_policy" "this" {

  id          = ""     # string | optional+computed

  # policy_data = ""     # string | computed

  audit_config { # set
    service = ""     # string | required

    audit_log_configs { # set [1..*]
      log_type         = ""     # string | required
      exempted_members = []     # set(string) | optional

    }

  }

  binding { # set
    members = []     # set(string) | required
    role    = ""     # string | required

    condition { # list [0..1]
      expression  = ""     # string | required
      title       = ""     # string | required
      description = ""     # string | optional

    }

  }

}


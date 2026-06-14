# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_iam_access_boundary_policy                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_iam_access_boundary_policy" "this" {

  name         = ""     # string | required | The name of the policy.
  parent       = ""     # string | required | The attachment point is identified by its URL-encoded full r…
  display_name = ""     # string | optional | The display name of the rule.
  id           = ""     # string | optional+computed

  # etag         = ""     # string | computed | The hash of the resource. Used internally during updates.

  rules { # list [1..*]
    description = ""     # string | optional | The description of the rule.

    access_boundary_rule { # list [0..1]
      available_permissions = []     # list(string) | optional | A list of permissions that may be allowed for use on the spe…
      available_resource    = ""     # string | optional | The full resource name of a Google Cloud resource entity.

      availability_condition { # list [0..1]
        expression  = ""     # string | required | Textual representation of an expression in Common Expression…
        description = ""     # string | optional | Description of the expression. This is a longer text which d…
        location    = ""     # string | optional | String indicating the location of the expression for error r…
        title       = ""     # string | optional | Title for the expression, i.e. a short string describing its…

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_iam_deny_policy                              │
# └──────────────────────────────────────────────────────────────┘
resource "google_iam_deny_policy" "this" {

  name         = ""     # string | required | The name of the policy.
  parent       = ""     # string | required | The attachment point is identified by its URL-encoded full r…
  display_name = ""     # string | optional | The display name of the rule.
  id           = ""     # string | optional+computed

  # etag         = ""     # string | computed | The hash of the resource. Used internally during updates.

  rules { # list [1..*]
    description = ""     # string | optional | The description of the rule.

    deny_rule { # list [0..1]
      denied_permissions    = []     # list(string) | optional | The permissions that are explicitly denied by this rule. Eac…
      denied_principals     = []     # list(string) | optional | The identities that are prevented from using one or more per…
      exception_permissions = []     # list(string) | optional | Specifies the permissions that this rule excludes from the s…
      exception_principals  = []     # list(string) | optional | The identities that are excluded from the deny rule, even if…

      denial_condition { # list [0..1]
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


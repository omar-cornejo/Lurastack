# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_org_policy_policy                            │
# └──────────────────────────────────────────────────────────────┘
resource "google_org_policy_policy" "this" {

  name   = ""     # string | required | Immutable. The resource name of the Policy. Must be one of t…
  parent = ""     # string | required | The parent of the resource.
  id     = ""     # string | optional+computed

  # etag   = ""     # string | computed | Optional. An opaque tag indicating the current state of the …

  dry_run_spec { # list [0..1]
    inherit_from_parent = false  # bool | optional | Determines the inheritance behavior for this policy. If 'inh…
    reset               = false  # bool | optional | Ignores policies set above this resource and restores the 'c…

    # etag                = ""     # string | computed | An opaque tag indicating the current version of the policy, …
    # update_time         = ""     # string | computed | Output only. The time stamp this was previously updated. Thi…

    rules { # list
      allow_all = ""     # string | optional | Setting this to '"TRUE"' means that all values are allowed. …
      deny_all  = ""     # string | optional | Setting this to '"TRUE"' means that all values are denied. T…
      enforce   = ""     # string | optional | If '"TRUE"', then the 'Policy' is enforced. If '"FALSE"', th…

      condition { # list [0..1]
        description = ""     # string | optional | Optional. Description of the expression. This is a longer te…
        expression  = ""     # string | optional | Textual representation of an expression in Common Expression…
        location    = ""     # string | optional | Optional. String indicating the location of the expression f…
        title       = ""     # string | optional | Optional. Title for the expression, i.e. a short string desc…

      }

      values { # list [0..1]
        allowed_values = []     # list(string) | optional | List of values allowed at this resource.
        denied_values  = []     # list(string) | optional | List of values denied at this resource.

      }

    }

  }

  spec { # list [0..1]
    inherit_from_parent = false  # bool | optional | Determines the inheritance behavior for this 'Policy'. If 'i…
    reset               = false  # bool | optional | Ignores policies set above this resource and restores the 'c…

    # etag                = ""     # string | computed | An opaque tag indicating the current version of the 'Policy'…
    # update_time         = ""     # string | computed | Output only. The time stamp this was previously updated. Thi…

    rules { # list
      allow_all = ""     # string | optional | Setting this to '"TRUE"' means that all values are allowed. …
      deny_all  = ""     # string | optional | Setting this to '"TRUE"' means that all values are denied. T…
      enforce   = ""     # string | optional | If '"TRUE"', then the 'Policy' is enforced. If '"FALSE"', th…

      condition { # list [0..1]
        description = ""     # string | optional | Optional. Description of the expression. This is a longer te…
        expression  = ""     # string | optional | Textual representation of an expression in Common Expression…
        location    = ""     # string | optional | Optional. String indicating the location of the expression f…
        title       = ""     # string | optional | Optional. Title for the expression, i.e. a short string desc…

      }

      values { # list [0..1]
        allowed_values = []     # list(string) | optional | List of values allowed at this resource.
        denied_values  = []     # list(string) | optional | List of values denied at this resource.

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


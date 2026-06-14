# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_resiliencehub_resiliency_policy                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_resiliencehub_resiliency_policy" "this" {

  name                     = ""     # string | required | The name of the policy.
  tier                     = ""     # string | required | The tier for the resiliency policy, ranging from the highest…
  data_location_constraint = ""     # string | optional+computed | Specifies a high-level geographical location constraint for …
  description              = ""     # string | optional | The description for the policy.
  tags                     = {}     # map(string) | optional

  # arn                      = ""     # string | computed
  # estimated_cost_tier      = ""     # string | computed | Specifies the estimated cost tier of the resiliency policy.
  # tags_all                 = {}     # map(string) | computed

  policy { # single

    az { # single
      rpo = ""     # string | required | Recovery Point Objective (RPO) as a Go duration.
      rto = ""     # string | required | Recovery Time Objective (RTO) as a Go duration.

    }

    hardware { # single
      rpo = ""     # string | required | Recovery Point Objective (RPO) as a Go duration.
      rto = ""     # string | required | Recovery Time Objective (RTO) as a Go duration.

    }

    region { # single
      rpo = ""     # string | optional | Recovery Point Objective (RPO) as a Go duration.
      rto = ""     # string | optional | Recovery Time Objective (RTO) as a Go duration.

    }

    software { # single
      rpo = ""     # string | required | Recovery Point Objective (RPO) as a Go duration.
      rto = ""     # string | required | Recovery Time Objective (RTO) as a Go duration.

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}


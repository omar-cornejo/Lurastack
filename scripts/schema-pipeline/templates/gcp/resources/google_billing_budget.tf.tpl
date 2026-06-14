# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_billing_budget                               │
# └──────────────────────────────────────────────────────────────┘
resource "google_billing_budget" "this" {

  billing_account = ""     # string | required | ID of the billing account to set a budget on.
  display_name    = ""     # string | optional | User data for display name in UI. Must be <= 60 chars.
  id              = ""     # string | optional+computed
  ownership_scope = ""     # string | optional | The ownership scope of the budget. The ownership scope and u…

  # name            = ""     # string | computed | Resource name of the budget. The resource name implies the s…

  all_updates_rule { # list [0..1]
    disable_default_iam_recipients   = false  # bool | optional | Boolean. When set to true, disables default notifications se…
    enable_project_level_recipients  = false  # bool | optional | When set to true, and when the budget has a single project c…
    monitoring_notification_channels = []     # list(string) | optional | The full resource name of a monitoring notification channel …
    pubsub_topic                     = ""     # string | optional | The name of the Cloud Pub/Sub topic where budget related mes…
    schema_version                   = ""     # string | optional | The schema version of the notification. Only "1.0" is accept…

  }

  amount { # list [1..1]
    last_period_amount = false  # bool | optional | Configures a budget amount that is automatically set to 100%…

    specified_amount { # list [0..1]
      currency_code = ""     # string | optional+computed | The 3-letter currency code defined in ISO 4217.
      nanos         = 0      # number | optional | Number of nano (10^-9) units of the amount. The value must b…
      units         = ""     # string | optional | The whole units of the amount. For example if currencyCode i…

    }

  }

  budget_filter { # list [0..1]
    calendar_period        = ""     # string | optional | A CalendarPeriod represents the abstract concept of a recurr…
    credit_types           = []     # list(string) | optional+computed | Optional. If creditTypesTreatment is INCLUDE_SPECIFIED_CREDI…
    credit_types_treatment = ""     # string | optional | Specifies how credits should be treated when determining spe…
    labels                 = {}     # map(string) | optional+computed | A single label and value pair specifying that usage from onl…
    projects               = []     # set(string) | optional | A set of projects of the form projects/{project_number}, spe…
    resource_ancestors     = []     # set(string) | optional | A set of folder and organization names of the form folders/{…
    services               = []     # list(string) | optional+computed | A set of services of the form services/{service_id}, specify…
    subaccounts            = []     # list(string) | optional+computed | A set of subaccounts of the form billingAccounts/{account_id…

    custom_period { # list [0..1]

      end_date { # list [0..1]
        day   = 0      # number | required | Day of a month. Must be from 1 to 31 and valid for the year …
        month = 0      # number | required | Month of a year. Must be from 1 to 12.
        year  = 0      # number | required | Year of the date. Must be from 1 to 9999.

      }

      start_date { # list [1..1]
        day   = 0      # number | required | Day of a month. Must be from 1 to 31 and valid for the year …
        month = 0      # number | required | Month of a year. Must be from 1 to 12.
        year  = 0      # number | required | Year of the date. Must be from 1 to 9999.

      }

    }

  }

  threshold_rules { # list
    threshold_percent = 0      # number | required | Send an alert when this threshold is exceeded. This is a 1.0…
    spend_basis       = ""     # string | optional | The type of basis used to determine if spend has passed the …

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_bigquery_datapolicy_data_policy              │
# └──────────────────────────────────────────────────────────────┘
resource "google_bigquery_datapolicy_data_policy" "this" {

  data_policy_id   = ""     # string | required | User-assigned (human readable) ID of the data policy that ne…
  data_policy_type = ""     # string | required | The enrollment level of the service. Possible values: ["COLU…
  location         = ""     # string | required | The name of the location of the data policy.
  policy_tag       = ""     # string | required | Policy tag resource name, in the format of projects/{project…
  id               = ""     # string | optional+computed
  project          = ""     # string | optional+computed

  # name             = ""     # string | computed | Resource name of this data policy, in the format of projects…

  data_masking_policy { # list [0..1]
    predefined_expression = ""     # string | optional | The available masking rules. Learn more here: https://cloud.…
    routine               = ""     # string | optional | The name of the BigQuery routine that contains the custom ma…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


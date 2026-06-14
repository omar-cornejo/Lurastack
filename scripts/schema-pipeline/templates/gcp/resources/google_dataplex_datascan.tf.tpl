# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataplex_datascan                            │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataplex_datascan" "this" {

  data_scan_id     = ""     # string | required | DataScan identifier. Must contain only lowercase letters, nu…
  location         = ""     # string | required | The location where the data scan should reside.
  description      = ""     # string | optional | Description of the scan.
  display_name     = ""     # string | optional | User friendly display name.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | User-defined labels for the scan. A list of key->value pairs…
  project          = ""     # string | optional+computed

  # create_time      = ""     # string | computed | The time when the scan was created.
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # execution_status = [  # list(object)
  #   {
  #     latest_job_end_time = ""
  #     latest_job_start_time = ""
  #   }
  # ]
  # name             = ""     # string | computed | The relative resource name of the scan, of the form: project…
  # state            = ""     # string | computed | Current state of the DataScan.
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # type             = ""     # string | computed | The type of DataScan.
  # uid              = ""     # string | computed | System generated globally unique ID for the scan. This ID wi…
  # update_time      = ""     # string | computed | The time when the scan was last updated.

  data { # list [1..1]
    entity   = ""     # string | optional | The Dataplex entity that represents the data source(e.g. Big…
    resource = ""     # string | optional | The service-qualified full resource name of the cloud resour…

  }

  data_profile_spec { # list [0..1]
    row_filter       = ""     # string | optional | A filter applied to all rows in a single DataScan job. The f…
    sampling_percent = 0      # number | optional | The percentage of the records to be selected from the datase…

    exclude_fields { # list [0..1]
      field_names = []     # list(string) | optional | Expected input is a list of fully qualified names of fields …

    }

    include_fields { # list [0..1]
      field_names = []     # list(string) | optional | Expected input is a list of fully qualified names of fields …

    }

    post_scan_actions { # list [0..1]

      bigquery_export { # list [0..1]
        results_table = ""     # string | optional | The BigQuery table to export DataProfileScan results to. For…

      }

    }

  }

  data_quality_spec { # list [0..1]
    row_filter       = ""     # string | optional | A filter applied to all rows in a single DataScan job. The f…
    sampling_percent = 0      # number | optional | The percentage of the records to be selected from the datase…

    post_scan_actions { # list [0..1]

      bigquery_export { # list [0..1]
        results_table = ""     # string | optional | The BigQuery table to export DataQualityScan results to. For…

      }

    }

    rules { # list
      dimension   = ""     # string | required | The dimension a rule belongs to. Results are also aggregated…
      column      = ""     # string | optional | The unnested column which this rule is evaluated against.
      description = ""     # string | optional | Description of the rule. The maximum length is 1,024 charact…
      ignore_null = false  # bool | optional | Rows with null values will automatically fail a rule, unless…
      name        = ""     # string | optional | A mutable name for the rule. The name must contain only lett…
      threshold   = 0      # number | optional | The minimum ratio of passing_rows / total_rows required to p…

      non_null_expectation {} # list [0..1]

      range_expectation { # list [0..1]
        max_value          = ""     # string | optional | The maximum column value allowed for a row to pass this vali…
        min_value          = ""     # string | optional | The minimum column value allowed for a row to pass this vali…
        strict_max_enabled = false  # bool | optional | Whether each value needs to be strictly lesser than ('<') th…
        strict_min_enabled = false  # bool | optional | Whether each value needs to be strictly greater than ('>') t…

      }

      regex_expectation { # list [0..1]
        regex = ""     # string | required | A regular expression the column value is expected to match.

      }

      row_condition_expectation { # list [0..1]
        sql_expression = ""     # string | required | The SQL expression.

      }

      set_expectation { # list [0..1]
        values = []     # list(string) | required | Expected values for the column value.

      }

      sql_assertion { # list [0..1]
        sql_statement = ""     # string | required | The SQL statement.

      }

      statistic_range_expectation { # list [0..1]
        statistic          = ""     # string | required | column statistics. Possible values: ["STATISTIC_UNDEFINED", …
        max_value          = ""     # string | optional | The maximum column statistic value allowed for a row to pass…
        min_value          = ""     # string | optional | The minimum column statistic value allowed for a row to pass…
        strict_max_enabled = false  # bool | optional | Whether column statistic needs to be strictly lesser than ('…
        strict_min_enabled = false  # bool | optional | Whether column statistic needs to be strictly greater than (…

      }

      table_condition_expectation { # list [0..1]
        sql_expression = ""     # string | required | The SQL expression.

      }

      uniqueness_expectation {} # list [0..1]

    }

  }

  execution_spec { # list [1..1]
    field = ""     # string | optional | The unnested field (of type Date or Timestamp) that contains…

    trigger { # list [1..1]

      on_demand {} # list [0..1]

      schedule { # list [0..1]
        cron = ""     # string | required | Cron schedule for running scans periodically. This field is …

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_storage_insights_report_config               │
# └──────────────────────────────────────────────────────────────┘
resource "google_storage_insights_report_config" "this" {

  location     = ""     # string | required | The location of the ReportConfig. The source and destination…
  display_name = ""     # string | optional | The editable display name of the inventory report configurat…
  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed

  # name         = ""     # string | computed | The UUID of the inventory report configuration.

  csv_options { # list [1..1]
    delimiter        = ""     # string | optional | The delimiter used to separate the fields in the inventory r…
    header_required  = false  # bool | optional | The boolean that indicates whether or not headers are includ…
    record_separator = ""     # string | optional | The character used to separate the records in the inventory …

  }

  frequency_options { # list [0..1]
    frequency = ""     # string | required | The frequency in which inventory reports are generated. Valu…

    end_date { # list [1..1]
      day   = 0      # number | required | The day of the month to stop generating inventory reports.
      month = 0      # number | required | The month to stop generating inventory reports.
      year  = 0      # number | required | The year to stop generating inventory reports

    }

    start_date { # list [1..1]
      day   = 0      # number | required | The day of the month to start generating inventory reports.
      month = 0      # number | required | The month to start generating inventory reports.
      year  = 0      # number | required | The year to start generating inventory reports

    }

  }

  object_metadata_report_options { # list [0..1]
    metadata_fields = []     # list(string) | required | The metadata fields included in an inventory report.

    storage_destination_options { # list [1..1]
      bucket           = ""     # string | required | The destination bucket that stores the generated inventory r…
      destination_path = ""     # string | optional | The path within the destination bucket to store generated in…

    }

    storage_filters { # list [0..1]
      bucket = ""     # string | optional | The filter to use when specifying which bucket to generate i…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


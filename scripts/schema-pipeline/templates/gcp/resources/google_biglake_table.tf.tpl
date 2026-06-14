# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_biglake_table                                │
# └──────────────────────────────────────────────────────────────┘
resource "google_biglake_table" "this" {

  name        = ""     # string | required | Output only. The name of the Table. Format: projects/{projec…
  database    = ""     # string | optional | The id of the parent database.
  id          = ""     # string | optional+computed
  type        = ""     # string | optional | The database type. Possible values: ["HIVE"]

  # create_time = ""     # string | computed | Output only. The creation time of the table. A timestamp in …
  # delete_time = ""     # string | computed | Output only. The deletion time of the table. Only set after …
  # etag        = ""     # string | computed | The checksum of a table object computed by the server based …
  # expire_time = ""     # string | computed | Output only. The time when this table is considered expired.…
  # update_time = ""     # string | computed | Output only. The last modification time of the table. A time…

  hive_options { # list [0..1]
    parameters = {}     # map(string) | optional | Stores user supplied Hive table parameters. An object contai…
    table_type = ""     # string | optional | Hive table type. For example, MANAGED_TABLE, EXTERNAL_TABLE.

    storage_descriptor { # list [0..1]
      input_format  = ""     # string | optional | The fully qualified Java class name of the input format.
      location_uri  = ""     # string | optional | Cloud Storage folder URI where the table data is stored, sta…
      output_format = ""     # string | optional | The fully qualified Java class name of the output format.

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_data_catalog_entry                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_data_catalog_entry" "this" {

  entry_group                = ""     # string | required | The name of the entry group this entry is in.
  entry_id                   = ""     # string | required | The id of the entry to create.
  description                = ""     # string | optional | Entry description, which can consist of several sentences or…
  display_name               = ""     # string | optional | Display information such as title and description. A short n…
  id                         = ""     # string | optional+computed
  linked_resource            = ""     # string | optional+computed | The resource this metadata entry refers to. For Google Cloud…
  schema                     = ""     # string | optional | Schema of the entry (e.g. BigQuery, GoogleSQL, Avro schema),…
  type                       = ""     # string | optional | The type of the entry. Only used for Entries with types in t…
  user_specified_system      = ""     # string | optional | This field indicates the entry's source system that Data Cat…
  user_specified_type        = ""     # string | optional | Entry type if it does not fit any of the input-allowed value…

  # bigquery_date_sharded_spec = [  # list(object)
  #   {
  #     dataset = ""
  #     shard_count = 0
  #     table_prefix = ""
  #   }
  # ]
  # bigquery_table_spec = [  # list(object)
  #   {
  #     table_source_type = ""
  #     table_spec = [  # list(object)
  #       {
  #         grouped_entry = ""
  #       }
  #     ]
  #     view_spec = [  # list(object)
  #       {
  #         view_query = ""
  #       }
  #     ]
  #   }
  # ]
  # integrated_system          = ""     # string | computed | This field indicates the entry's source system that Data Cat…
  # name                       = ""     # string | computed | The Data Catalog resource name of the entry in URL format. E…

  gcs_fileset_spec { # list [0..1]
    file_patterns         = []     # list(string) | required | Patterns to identify a set of files in Google Cloud Storage.…

    # sample_gcs_file_specs = [  # list(object)
    #   {
    #     file_path = ""
    #     size_bytes = 0
    #   }
    # ]

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


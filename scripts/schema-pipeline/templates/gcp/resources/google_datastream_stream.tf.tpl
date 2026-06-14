# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_datastream_stream                            │
# └──────────────────────────────────────────────────────────────┘
resource "google_datastream_stream" "this" {

  display_name                    = ""     # string | required | Display name.
  location                        = ""     # string | required | The name of the location this stream is located in.
  stream_id                       = ""     # string | required | The stream identifier.
  create_without_validation       = false  # bool | optional | Create the stream without validating it.
  customer_managed_encryption_key = ""     # string | optional | A reference to a KMS encryption key. If provided, it will be…
  desired_state                   = ""     # string | optional | Desired state of the Stream. Set this field to 'RUNNING' to …
  id                              = ""     # string | optional+computed
  labels                          = {}     # map(string) | optional | Labels.  **Note**: This field is non-authoritative, and will…
  project                         = ""     # string | optional+computed

  # effective_labels                = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # name                            = ""     # string | computed | The stream's name.
  # state                           = ""     # string | computed | The state of the stream.
  # terraform_labels                = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  backfill_all { # list [0..1]

    mysql_excluded_objects { # list [0..1]

      mysql_databases { # list [1..*]
        database = ""     # string | required | Database name.

        mysql_tables { # list
          table = ""     # string | required | Table name.

          mysql_columns { # list
            collation        = ""     # string | optional | Column collation.
            column           = ""     # string | optional | Column name.
            data_type        = ""     # string | optional | The MySQL data type. Full data types list can be found here:…
            nullable         = false  # bool | optional | Whether or not the column can accept a null value.
            ordinal_position = 0      # number | optional | The ordinal position of the column in the table.
            primary_key      = false  # bool | optional | Whether or not the column represents a primary key.

            # length           = 0      # number | computed | Column length.

          }

        }

      }

    }

    oracle_excluded_objects { # list [0..1]

      oracle_schemas { # list [1..*]
        schema = ""     # string | required | Schema name.

        oracle_tables { # list
          table = ""     # string | required | Table name.

          oracle_columns { # list
            column           = ""     # string | optional | Column name.
            data_type        = ""     # string | optional | The Oracle data type. Full data types list can be found here…

            # encoding         = ""     # string | computed | Column encoding.
            # length           = 0      # number | computed | Column length.
            # nullable         = false  # bool | computed | Whether or not the column can accept a null value.
            # ordinal_position = 0      # number | computed | The ordinal position of the column in the table.
            # precision        = 0      # number | computed | Column precision.
            # primary_key      = false  # bool | computed | Whether or not the column represents a primary key.
            # scale            = 0      # number | computed | Column scale.

          }

        }

      }

    }

    postgresql_excluded_objects { # list [0..1]

      postgresql_schemas { # list [1..*]
        schema = ""     # string | required | Database name.

        postgresql_tables { # list
          table = ""     # string | required | Table name.

          postgresql_columns { # list
            column           = ""     # string | optional | Column name.
            data_type        = ""     # string | optional | The PostgreSQL data type. Full data types list can be found …
            nullable         = false  # bool | optional | Whether or not the column can accept a null value.
            ordinal_position = 0      # number | optional | The ordinal position of the column in the table.
            primary_key      = false  # bool | optional | Whether or not the column represents a primary key.

            # length           = 0      # number | computed | Column length.
            # precision        = 0      # number | computed | Column precision.
            # scale            = 0      # number | computed | Column scale.

          }

        }

      }

    }

    sql_server_excluded_objects { # list [0..1]

      schemas { # list [1..*]
        schema = ""     # string | required | Schema name.

        tables { # list
          table = ""     # string | required | Table name.

          columns { # list
            column           = ""     # string | optional | Column name.
            data_type        = ""     # string | optional | The SQL Server data type. Full data types list can be found …

            # length           = 0      # number | computed | Column length.
            # nullable         = false  # bool | computed | Whether or not the column can accept a null value.
            # ordinal_position = 0      # number | computed | The ordinal position of the column in the table.
            # precision        = 0      # number | computed | Column precision.
            # primary_key      = false  # bool | computed | Whether or not the column represents a primary key.
            # scale            = 0      # number | computed | Column scale.

          }

        }

      }

    }

  }

  backfill_none {} # list [0..1]

  destination_config { # list [1..1]
    destination_connection_profile = ""     # string | required | Destination connection profile resource. Format: projects/{p…

    bigquery_destination_config { # list [0..1]
      data_freshness = ""     # string | optional | The guaranteed data freshness (in seconds) when querying tab…

      append_only {} # list [0..1]

      merge {} # list [0..1]

      single_target_dataset { # list [0..1]
        dataset_id = ""     # string | required | Dataset ID in the format projects/{project}/datasets/{datase…

      }

      source_hierarchy_datasets { # list [0..1]

        dataset_template { # list [1..1]
          location          = ""     # string | required | The geographic location where the dataset should reside. See…
          dataset_id_prefix = ""     # string | optional | If supplied, every created dataset will have its name prefix…
          kms_key_name      = ""     # string | optional | Describes the Cloud KMS encryption key that will be used to …

        }

      }

    }

    gcs_destination_config { # list [0..1]
      file_rotation_interval = ""     # string | optional+computed | The maximum duration for which new events are added before a…
      file_rotation_mb       = 0      # number | optional+computed | The maximum file size to be saved in the bucket.
      path                   = ""     # string | optional | Path inside the Cloud Storage bucket to write data to.

      avro_file_format {} # list [0..1]

      json_file_format { # list [0..1]
        compression        = ""     # string | optional | Compression of the loaded JSON file. Possible values: ["NO_C…
        schema_file_format = ""     # string | optional | The schema file format along JSON data files. Possible value…

      }

    }

  }

  source_config { # list [1..1]
    source_connection_profile = ""     # string | required | Source connection profile resource. Format: projects/{projec…

    mysql_source_config { # list [0..1]
      max_concurrent_backfill_tasks = 0      # number | optional+computed | Maximum number of concurrent backfill tasks. The number shou…
      max_concurrent_cdc_tasks      = 0      # number | optional+computed | Maximum number of concurrent CDC tasks. The number should be…

      exclude_objects { # list [0..1]

        mysql_databases { # list [1..*]
          database = ""     # string | required | Database name.

          mysql_tables { # list
            table = ""     # string | required | Table name.

            mysql_columns { # list
              collation        = ""     # string | optional | Column collation.
              column           = ""     # string | optional | Column name.
              data_type        = ""     # string | optional | The MySQL data type. Full data types list can be found here:…
              nullable         = false  # bool | optional | Whether or not the column can accept a null value.
              ordinal_position = 0      # number | optional | The ordinal position of the column in the table.
              primary_key      = false  # bool | optional | Whether or not the column represents a primary key.

              # length           = 0      # number | computed | Column length.

            }

          }

        }

      }

      include_objects { # list [0..1]

        mysql_databases { # list [1..*]
          database = ""     # string | required | Database name.

          mysql_tables { # list
            table = ""     # string | required | Table name.

            mysql_columns { # list
              collation        = ""     # string | optional | Column collation.
              column           = ""     # string | optional | Column name.
              data_type        = ""     # string | optional | The MySQL data type. Full data types list can be found here:…
              nullable         = false  # bool | optional | Whether or not the column can accept a null value.
              ordinal_position = 0      # number | optional | The ordinal position of the column in the table.
              primary_key      = false  # bool | optional | Whether or not the column represents a primary key.

              # length           = 0      # number | computed | Column length.

            }

          }

        }

      }

    }

    oracle_source_config { # list [0..1]
      max_concurrent_backfill_tasks = 0      # number | optional+computed | Maximum number of concurrent backfill tasks. The number shou…
      max_concurrent_cdc_tasks      = 0      # number | optional+computed | Maximum number of concurrent CDC tasks. The number should be…

      drop_large_objects {} # list [0..1]

      exclude_objects { # list [0..1]

        oracle_schemas { # list [1..*]
          schema = ""     # string | required | Schema name.

          oracle_tables { # list
            table = ""     # string | required | Table name.

            oracle_columns { # list
              column           = ""     # string | optional | Column name.
              data_type        = ""     # string | optional | The Oracle data type. Full data types list can be found here…

              # encoding         = ""     # string | computed | Column encoding.
              # length           = 0      # number | computed | Column length.
              # nullable         = false  # bool | computed | Whether or not the column can accept a null value.
              # ordinal_position = 0      # number | computed | The ordinal position of the column in the table.
              # precision        = 0      # number | computed | Column precision.
              # primary_key      = false  # bool | computed | Whether or not the column represents a primary key.
              # scale            = 0      # number | computed | Column scale.

            }

          }

        }

      }

      include_objects { # list [0..1]

        oracle_schemas { # list [1..*]
          schema = ""     # string | required | Schema name.

          oracle_tables { # list
            table = ""     # string | required | Table name.

            oracle_columns { # list
              column           = ""     # string | optional | Column name.
              data_type        = ""     # string | optional | The Oracle data type. Full data types list can be found here…

              # encoding         = ""     # string | computed | Column encoding.
              # length           = 0      # number | computed | Column length.
              # nullable         = false  # bool | computed | Whether or not the column can accept a null value.
              # ordinal_position = 0      # number | computed | The ordinal position of the column in the table.
              # precision        = 0      # number | computed | Column precision.
              # primary_key      = false  # bool | computed | Whether or not the column represents a primary key.
              # scale            = 0      # number | computed | Column scale.

            }

          }

        }

      }

      stream_large_objects {} # list [0..1]

    }

    postgresql_source_config { # list [0..1]
      publication                   = ""     # string | required | The name of the publication that includes the set of all tab…
      replication_slot              = ""     # string | required | The name of the logical replication slot that's configured w…
      max_concurrent_backfill_tasks = 0      # number | optional+computed | Maximum number of concurrent backfill tasks. The number shou…

      exclude_objects { # list [0..1]

        postgresql_schemas { # list [1..*]
          schema = ""     # string | required | Database name.

          postgresql_tables { # list
            table = ""     # string | required | Table name.

            postgresql_columns { # list
              column           = ""     # string | optional | Column name.
              data_type        = ""     # string | optional | The PostgreSQL data type. Full data types list can be found …
              nullable         = false  # bool | optional | Whether or not the column can accept a null value.
              ordinal_position = 0      # number | optional | The ordinal position of the column in the table.
              primary_key      = false  # bool | optional | Whether or not the column represents a primary key.

              # length           = 0      # number | computed | Column length.
              # precision        = 0      # number | computed | Column precision.
              # scale            = 0      # number | computed | Column scale.

            }

          }

        }

      }

      include_objects { # list [0..1]

        postgresql_schemas { # list [1..*]
          schema = ""     # string | required | Database name.

          postgresql_tables { # list
            table = ""     # string | required | Table name.

            postgresql_columns { # list
              column           = ""     # string | optional | Column name.
              data_type        = ""     # string | optional | The PostgreSQL data type. Full data types list can be found …
              nullable         = false  # bool | optional | Whether or not the column can accept a null value.
              ordinal_position = 0      # number | optional | The ordinal position of the column in the table.
              primary_key      = false  # bool | optional | Whether or not the column represents a primary key.

              # length           = 0      # number | computed | Column length.
              # precision        = 0      # number | computed | Column precision.
              # scale            = 0      # number | computed | Column scale.

            }

          }

        }

      }

    }

    sql_server_source_config { # list [0..1]
      max_concurrent_backfill_tasks = 0      # number | optional+computed | Max concurrent backfill tasks.
      max_concurrent_cdc_tasks      = 0      # number | optional+computed | Max concurrent CDC tasks.

      exclude_objects { # list [0..1]

        schemas { # list [1..*]
          schema = ""     # string | required | Schema name.

          tables { # list
            table = ""     # string | required | Table name.

            columns { # list
              column           = ""     # string | optional | Column name.
              data_type        = ""     # string | optional | The SQL Server data type. Full data types list can be found …

              # length           = 0      # number | computed | Column length.
              # nullable         = false  # bool | computed | Whether or not the column can accept a null value.
              # ordinal_position = 0      # number | computed | The ordinal position of the column in the table.
              # precision        = 0      # number | computed | Column precision.
              # primary_key      = false  # bool | computed | Whether or not the column represents a primary key.
              # scale            = 0      # number | computed | Column scale.

            }

          }

        }

      }

      include_objects { # list [0..1]

        schemas { # list [1..*]
          schema = ""     # string | required | Schema name.

          tables { # list
            table = ""     # string | required | Table name.

            columns { # list
              column           = ""     # string | optional | Column name.
              data_type        = ""     # string | optional | The SQL Server data type. Full data types list can be found …

              # length           = 0      # number | computed | Column length.
              # nullable         = false  # bool | computed | Whether or not the column can accept a null value.
              # ordinal_position = 0      # number | computed | The ordinal position of the column in the table.
              # precision        = 0      # number | computed | Column precision.
              # primary_key      = false  # bool | computed | Whether or not the column represents a primary key.
              # scale            = 0      # number | computed | Column scale.

            }

          }

        }

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


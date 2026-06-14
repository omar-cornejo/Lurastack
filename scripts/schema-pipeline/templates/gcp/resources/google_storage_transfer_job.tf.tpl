# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_storage_transfer_job                         │
# └──────────────────────────────────────────────────────────────┘
resource "google_storage_transfer_job" "this" {

  description            = ""     # string | required | Unique description to identify the Transfer Job.
  id                     = ""     # string | optional+computed
  name                   = ""     # string | optional+computed | The name of the Transfer Job.
  project                = ""     # string | optional+computed | The project in which the resource belongs. If it is not prov…
  status                 = ""     # string | optional | Status of the job. Default: ENABLED. NOTE: The effect of the…

  # creation_time          = ""     # string | computed | When the Transfer Job was created.
  # deletion_time          = ""     # string | computed | When the Transfer Job was deleted.
  # last_modification_time = ""     # string | computed | When the Transfer Job was last modified.

  event_stream { # list [0..1]
    name                         = ""     # string | required | Specifies a unique name of the resource such as AWS SQS ARN …
    event_stream_expiration_time = ""     # string | optional | Specifies the data and time at which Storage Transfer Servic…
    event_stream_start_time      = ""     # string | optional | Specifies the date and time that Storage Transfer Service st…

  }

  notification_config { # list [0..1]
    payload_format = ""     # string | required | The desired format of the notification message payloads. One…
    pubsub_topic   = ""     # string | required | The Topic.name of the Pub/Sub topic to which to publish noti…
    event_types    = []     # set(string) | optional | Event types for which a notification is desired. If empty, s…

  }

  schedule { # list [0..1]
    repeat_interval = ""     # string | optional | Interval between the start of each scheduled transfer. If un…

    schedule_end_date { # list [0..1]
      day   = 0      # number | required | Day of month. Must be from 1 to 31 and valid for the year an…
      month = 0      # number | required | Month of year. Must be from 1 to 12.
      year  = 0      # number | required | Year of date. Must be from 1 to 9999.

    }

    schedule_start_date { # list [1..1]
      day   = 0      # number | required | Day of month. Must be from 1 to 31 and valid for the year an…
      month = 0      # number | required | Month of year. Must be from 1 to 12.
      year  = 0      # number | required | Year of date. Must be from 1 to 9999.

    }

    start_time_of_day { # list [0..1]
      hours   = 0      # number | required | Hours of day in 24 hour format. Should be from 0 to 23.
      minutes = 0      # number | required | Minutes of hour of day. Must be from 0 to 59.
      nanos   = 0      # number | required | Fractions of seconds in nanoseconds. Must be from 0 to 999,9…
      seconds = 0      # number | required | Seconds of minutes of the time. Must normally be from 0 to 5…

    }

  }

  transfer_spec { # list [1..1]
    sink_agent_pool_name   = ""     # string | optional+computed | Specifies the agent pool name associated with the posix data…
    source_agent_pool_name = ""     # string | optional+computed | Specifies the agent pool name associated with the posix data…

    aws_s3_data_source { # list [0..1]
      bucket_name = ""     # string | required | S3 Bucket name.
      path        = ""     # string | optional | S3 Bucket path in bucket to transfer.
      role_arn    = ""     # string | optional | The Amazon Resource Name (ARN) of the role to support tempor…

      aws_access_key { # list [0..1]
        access_key_id     = ""     # string | required+sensitive | AWS Key ID.
        secret_access_key = ""     # string | required+sensitive | AWS Secret Access Key.

      }

    }

    azure_blob_storage_data_source { # list [0..1]
      container       = ""     # string | required | The container to transfer from the Azure Storage account.
      storage_account = ""     # string | required | The name of the Azure Storage account.
      path            = ""     # string | optional+computed | Root path to transfer objects. Must be an empty string or fu…

      azure_credentials { # list [1..1]
        sas_token = ""     # string | required+sensitive | Azure shared access signature.

      }

    }

    gcs_data_sink { # list [0..1]
      bucket_name = ""     # string | required | Google Cloud Storage bucket name.
      path        = ""     # string | optional+computed | Google Cloud Storage path in bucket to transfer

    }

    gcs_data_source { # list [0..1]
      bucket_name = ""     # string | required | Google Cloud Storage bucket name.
      path        = ""     # string | optional+computed | Google Cloud Storage path in bucket to transfer

    }

    http_data_source { # list [0..1]
      list_url = ""     # string | required | The URL that points to the file that stores the object list …

    }

    object_conditions { # list [0..1]
      exclude_prefixes                         = []     # list(string) | optional | exclude_prefixes must follow the requirements described for …
      include_prefixes                         = []     # list(string) | optional | If include_refixes is specified, objects that satisfy the ob…
      last_modified_before                     = ""     # string | optional | If specified, only objects with a "last modification time" b…
      last_modified_since                      = ""     # string | optional | If specified, only objects with a "last modification time" o…
      max_time_elapsed_since_last_modification = ""     # string | optional | A duration in seconds with up to nine fractional digits, ter…
      min_time_elapsed_since_last_modification = ""     # string | optional | A duration in seconds with up to nine fractional digits, ter…

    }

    posix_data_sink { # list [0..1]
      root_directory = ""     # string | required | Root directory path to the filesystem.

    }

    posix_data_source { # list [0..1]
      root_directory = ""     # string | required | Root directory path to the filesystem.

    }

    transfer_options { # list [0..1]
      delete_objects_from_source_after_transfer  = false  # bool | optional | Whether objects should be deleted from the source after they…
      delete_objects_unique_in_sink              = false  # bool | optional | Whether objects that exist only in the sink should be delete…
      overwrite_objects_already_existing_in_sink = false  # bool | optional | Whether overwriting objects that already exist in the sink i…
      overwrite_when                             = ""     # string | optional | When to overwrite objects that already exist in the sink. If…

    }

  }

}


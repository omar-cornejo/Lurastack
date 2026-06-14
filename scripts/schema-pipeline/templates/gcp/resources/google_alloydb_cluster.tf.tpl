# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_alloydb_cluster                              │
# └──────────────────────────────────────────────────────────────┘
resource "google_alloydb_cluster" "this" {

  cluster_id             = ""     # string | required | The ID of the alloydb cluster.
  location               = ""     # string | required | The location where the alloydb cluster should reside.
  annotations            = {}     # map(string) | optional | Annotations to allow client tools to store small amount of a…
  cluster_type           = ""     # string | optional | The type of cluster. If not set, defaults to PRIMARY. Defaul…
  database_version       = ""     # string | optional+computed | The database engine major version. This is an optional field…
  deletion_policy        = ""     # string | optional | Policy to determine if the cluster should be deleted forcefu…
  display_name           = ""     # string | optional | User-settable and human-readable display name for the Cluste…
  etag                   = ""     # string | optional | For Resource freshness validation (https://google.aip.dev/15…
  id                     = ""     # string | optional+computed
  labels                 = {}     # map(string) | optional | User-defined labels for the alloydb cluster.  **Note**: This…
  network                = ""     # string | optional+computed+DEPRECATED | The relative resource name of the VPC network on which the i…
  project                = ""     # string | optional+computed

  # backup_source = [  # list(object)
  #   {
  #     backup_name = ""
  #   }
  # ]
  # continuous_backup_info = [  # list(object)
  #   {
  #     earliest_restorable_time = ""
  #     enabled_time = ""
  #     encryption_info = [  # list(object)
  #       {
  #         encryption_type = ""
  #         kms_key_versions = []  # list(string)
  #       }
  #     ]
  #     schedule = []  # list(string)
  #   }
  # ]
  # effective_annotations  = {}     # map(string) | computed | All of annotations (key/value pairs) present on the resource…
  # effective_labels       = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # encryption_info = [  # list(object)
  #   {
  #     encryption_type = ""
  #     kms_key_versions = []  # list(string)
  #   }
  # ]
  # migration_source = [  # list(object)
  #   {
  #     host_port = ""
  #     reference_id = ""
  #     source_type = ""
  #   }
  # ]
  # name                   = ""     # string | computed | The name of the cluster resource.
  # reconciling            = false  # bool | computed | Output only. Reconciling (https://google.aip.dev/128#reconci…
  # state                  = ""     # string | computed | Output only. The current serving state of the cluster.
  # terraform_labels       = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uid                    = ""     # string | computed | The system-generated UID of the resource.

  automated_backup_policy { # list [0..1]
    backup_window = ""     # string | optional+computed | The length of the time window during which a backup can be t…
    enabled       = false  # bool | optional+computed | Whether automated backups are enabled.
    labels        = {}     # map(string) | optional | Labels to apply to backups created using this configuration.
    location      = ""     # string | optional+computed | The location where the backup will be stored. Currently, the…

    encryption_config { # list [0..1]
      kms_key_name = ""     # string | optional | The fully-qualified resource name of the KMS key. Each Cloud…

    }

    quantity_based_retention { # list [0..1]
      count = 0      # number | optional | The number of backups to retain.

    }

    time_based_retention { # list [0..1]
      retention_period = ""     # string | optional | The retention period. A duration in seconds with up to nine …

    }

    weekly_schedule { # list [0..1]
      days_of_week = []     # list(string) | optional | The days of the week to perform a backup. At least one day o…

      start_times { # list [1..*]
        hours   = 0      # number | optional | Hours of day in 24 hour format. Should be from 0 to 23. An A…
        minutes = 0      # number | optional | Minutes of hour of day. Currently, only the value 0 is suppo…
        nanos   = 0      # number | optional | Fractions of seconds in nanoseconds. Currently, only the val…
        seconds = 0      # number | optional | Seconds of minutes of the time. Currently, only the value 0 …

      }

    }

  }

  continuous_backup_config { # list [0..1]
    enabled              = false  # bool | optional | Whether continuous backup recovery is enabled. If not set, d…
    recovery_window_days = 0      # number | optional+computed | The numbers of days that are eligible to restore from using …

    encryption_config { # list [0..1]
      kms_key_name = ""     # string | optional | The fully-qualified resource name of the KMS key. Each Cloud…

    }

  }

  encryption_config { # list [0..1]
    kms_key_name = ""     # string | optional | The fully-qualified resource name of the KMS key. Each Cloud…

  }

  initial_user { # list [0..1]
    password = ""     # string | required+sensitive | The initial password for the user.
    user     = ""     # string | optional | The database username.

  }

  maintenance_update_policy { # list [0..1]

    maintenance_windows { # list
      day = ""     # string | required | Preferred day of the week for maintenance, e.g. MONDAY, TUES…

      start_time { # list [1..1]
        hours   = 0      # number | required | Hours of day in 24 hour format. Should be from 0 to 23.
        minutes = 0      # number | optional | Minutes of hour of day. Currently, only the value 0 is suppo…
        nanos   = 0      # number | optional | Fractions of seconds in nanoseconds. Currently, only the val…
        seconds = 0      # number | optional | Seconds of minutes of the time. Currently, only the value 0 …

      }

    }

  }

  network_config { # list [0..1]
    allocated_ip_range = ""     # string | optional | The name of the allocated IP range for the private IP AlloyD…
    network            = ""     # string | optional | The resource link for the VPC network in which cluster resou…

  }

  psc_config { # list [0..1]
    psc_enabled = false  # bool | optional | Create an instance that allows connections from Private Serv…

  }

  restore_backup_source { # list [0..1]
    backup_name = ""     # string | required | The name of the backup that this cluster is restored from.

  }

  restore_continuous_backup_source { # list [0..1]
    cluster       = ""     # string | required | The name of the source cluster that this cluster is restored…
    point_in_time = ""     # string | required | The point in time that this cluster is restored to, in RFC 3…

  }

  secondary_config { # list [0..1]
    primary_cluster_name = ""     # string | required | Name of the primary cluster must be in the format 'projects/…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_gke_backup_backup_plan                       │
# └──────────────────────────────────────────────────────────────┘
resource "google_gke_backup_backup_plan" "this" {

  cluster             = ""     # string | required | The source cluster from which Backups will be created via th…
  location            = ""     # string | required | The region of the Backup Plan.
  name                = ""     # string | required | The full name of the BackupPlan Resource.
  deactivated         = false  # bool | optional+computed | This flag indicates whether this BackupPlan has been deactiv…
  description         = ""     # string | optional | User specified descriptive string for this BackupPlan.
  id                  = ""     # string | optional+computed
  labels              = {}     # map(string) | optional | Description: A set of custom labels supplied by the user. A …
  project             = ""     # string | optional+computed

  # effective_labels    = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # etag                = ""     # string | computed | etag is used for optimistic concurrency control as a way to …
  # protected_pod_count = 0      # number | computed | The number of Kubernetes Pods backed up in the last successf…
  # state               = ""     # string | computed | The State of the BackupPlan.
  # state_reason        = ""     # string | computed | Detailed description of why BackupPlan is in its current sta…
  # terraform_labels    = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uid                 = ""     # string | computed | Server generated, unique identifier of UUID format.

  backup_config { # list [0..1]
    all_namespaces      = false  # bool | optional | If True, include all namespaced resources.
    include_secrets     = false  # bool | optional+computed | This flag specifies whether Kubernetes Secret resources shou…
    include_volume_data = false  # bool | optional+computed | This flag specifies whether volume data should be backed up …
    permissive_mode     = false  # bool | optional | This flag specifies whether Backups will not fail when Backu…

    encryption_key { # list [0..1]
      gcp_kms_encryption_key = ""     # string | required | Google Cloud KMS encryption key. Format: projects/*/location…

    }

    selected_applications { # list [0..1]

      namespaced_names { # list [1..*]
        name      = ""     # string | required | The name of a Kubernetes Resource.
        namespace = ""     # string | required | The namespace of a Kubernetes Resource.

      }

    }

    selected_namespaces { # list [0..1]
      namespaces = []     # list(string) | required | A list of Kubernetes Namespaces.

    }

  }

  backup_schedule { # list [0..1]
    cron_schedule = ""     # string | optional | A standard cron string that defines a repeating schedule for…
    paused        = false  # bool | optional+computed | This flag denotes whether automatic Backup creation is pause…

    rpo_config { # list [0..1]
      target_rpo_minutes = 0      # number | required | Defines the target RPO for the BackupPlan in minutes, which …

      exclusion_windows { # list
        duration = ""     # string | required | Specifies duration of the window in seconds with up to nine …
        daily    = false  # bool | optional | The exclusion window occurs every day if set to "True". Spec…

        days_of_week { # list [0..1]
          days_of_week = []     # list(string) | optional | A list of days of week. Possible values: ["MONDAY", "TUESDAY…

        }

        single_occurrence_date { # list [0..1]
          day   = 0      # number | optional | Day of a month.
          month = 0      # number | optional | Month of a year.
          year  = 0      # number | optional | Year of the date.

        }

        start_time { # list [1..1]
          hours   = 0      # number | optional | Hours of day in 24 hour format.
          minutes = 0      # number | optional | Minutes of hour of day.
          nanos   = 0      # number | optional | Fractions of seconds in nanoseconds.
          seconds = 0      # number | optional | Seconds of minutes of the time.

        }

      }

    }

  }

  retention_policy { # list [0..1]
    backup_delete_lock_days = 0      # number | optional+computed | Minimum age for a Backup created via this BackupPlan (in day…
    backup_retain_days      = 0      # number | optional+computed | The default maximum age of a Backup created via this BackupP…
    locked                  = false  # bool | optional+computed | This flag denotes whether the retention policy of this Backu…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


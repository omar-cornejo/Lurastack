# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_os_config_patch_deployment                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_os_config_patch_deployment" "this" {

  patch_deployment_id = ""     # string | required | A name for the patch deployment in the project. When creatin…
  description         = ""     # string | optional | Description of the patch deployment. Length of the descripti…
  duration            = ""     # string | optional | Duration of the patch. After the duration ends, the patch ti…
  id                  = ""     # string | optional+computed
  project             = ""     # string | optional+computed

  # create_time         = ""     # string | computed | Time the patch deployment was created. Timestamp is in RFC33…
  # last_execute_time   = ""     # string | computed | The last time a patch job was started by this deployment. Ti…
  # name                = ""     # string | computed | Unique name for the patch deployment resource in a project. …
  # update_time         = ""     # string | computed | Time the patch deployment was last updated. Timestamp is in …

  instance_filter { # list [1..1]
    all                    = false  # bool | optional | Target all VM instances in the project. If true, no other cr…
    instance_name_prefixes = []     # list(string) | optional | Targets VMs whose name starts with one of these prefixes. Si…
    instances              = []     # list(string) | optional | Targets any of the VM instances specified. Instances are spe…
    zones                  = []     # list(string) | optional | Targets VM instances in ANY of these zones. Leave empty to t…

    group_labels { # list
      labels = {}     # map(string) | required | Compute Engine instance labels that must be present for a VM…

    }

  }

  one_time_schedule { # list [0..1]
    execute_time = ""     # string | required | The desired patch job execution time. A timestamp in RFC3339…

  }

  patch_config { # list [0..1]
    mig_instances_allowed = false  # bool | optional | Allows the patch job to run on Managed instance groups (MIGs…
    reboot_config         = ""     # string | optional | Post-patch reboot settings. Possible values: ["DEFAULT", "AL…

    apt { # list [0..1]
      excludes           = []     # list(string) | optional | List of packages to exclude from update. These packages will…
      exclusive_packages = []     # list(string) | optional | An exclusive list of packages to be updated. These are the o…
      type               = ""     # string | optional | By changing the type to DIST, the patching is performed usin…

    }

    goo { # list [0..1]
      enabled = false  # bool | required | goo update settings. Use this setting to override the defaul…

    }

    post_step { # list [0..1]

      linux_exec_step_config { # list [0..1]
        allowed_success_codes = []     # list(number) | optional | Defaults to [0]. A list of possible return values that the e…
        interpreter           = ""     # string | optional | The script interpreter to use to run the script. If no inter…
        local_path            = ""     # string | optional | An absolute path to the executable on the VM.

        gcs_object { # list [0..1]
          bucket            = ""     # string | required | Bucket of the Cloud Storage object.
          generation_number = ""     # string | required | Generation number of the Cloud Storage object. This is used …
          object            = ""     # string | required | Name of the Cloud Storage object.

        }

      }

      windows_exec_step_config { # list [0..1]
        allowed_success_codes = []     # list(number) | optional | Defaults to [0]. A list of possible return values that the e…
        interpreter           = ""     # string | optional | The script interpreter to use to run the script. If no inter…
        local_path            = ""     # string | optional | An absolute path to the executable on the VM.

        gcs_object { # list [0..1]
          bucket            = ""     # string | required | Bucket of the Cloud Storage object.
          generation_number = ""     # string | required | Generation number of the Cloud Storage object. This is used …
          object            = ""     # string | required | Name of the Cloud Storage object.

        }

      }

    }

    pre_step { # list [0..1]

      linux_exec_step_config { # list [0..1]
        allowed_success_codes = []     # list(number) | optional | Defaults to [0]. A list of possible return values that the e…
        interpreter           = ""     # string | optional | The script interpreter to use to run the script. If no inter…
        local_path            = ""     # string | optional | An absolute path to the executable on the VM.

        gcs_object { # list [0..1]
          bucket            = ""     # string | required | Bucket of the Cloud Storage object.
          generation_number = ""     # string | required | Generation number of the Cloud Storage object. This is used …
          object            = ""     # string | required | Name of the Cloud Storage object.

        }

      }

      windows_exec_step_config { # list [0..1]
        allowed_success_codes = []     # list(number) | optional | Defaults to [0]. A list of possible return values that the e…
        interpreter           = ""     # string | optional | The script interpreter to use to run the script. If no inter…
        local_path            = ""     # string | optional | An absolute path to the executable on the VM.

        gcs_object { # list [0..1]
          bucket            = ""     # string | required | Bucket of the Cloud Storage object.
          generation_number = ""     # string | required | Generation number of the Cloud Storage object. This is used …
          object            = ""     # string | required | Name of the Cloud Storage object.

        }

      }

    }

    windows_update { # list [0..1]
      classifications   = []     # list(string) | optional | Only apply updates of these windows update classifications. …
      excludes          = []     # list(string) | optional | List of KBs to exclude from update.
      exclusive_patches = []     # list(string) | optional | An exclusive list of kbs to be updated. These are the only p…

    }

    yum { # list [0..1]
      excludes           = []     # list(string) | optional | List of packages to exclude from update. These packages will…
      exclusive_packages = []     # list(string) | optional | An exclusive list of packages to be updated. These are the o…
      minimal            = false  # bool | optional | Will cause patch to run yum update-minimal instead.
      security           = false  # bool | optional | Adds the --security flag to yum update. Not supported on all…

    }

    zypper { # list [0..1]
      categories        = []     # list(string) | optional | Install only patches with these categories. Common categorie…
      excludes          = []     # list(string) | optional | List of packages to exclude from update.
      exclusive_patches = []     # list(string) | optional | An exclusive list of patches to be updated. These are the on…
      severities        = []     # list(string) | optional | Install only patches with these severities. Common severitie…
      with_optional     = false  # bool | optional | Adds the --with-optional flag to zypper patch.
      with_update       = false  # bool | optional | Adds the --with-update flag, to zypper patch.

    }

  }

  recurring_schedule { # list [0..1]
    end_time          = ""     # string | optional | The end time at which a recurring patch deployment schedule …
    start_time        = ""     # string | optional | The time that the recurring schedule becomes effective. Defa…

    # last_execute_time = ""     # string | computed | The time the last patch job ran successfully. A timestamp in…
    # next_execute_time = ""     # string | computed | The time the next patch job is scheduled to run. A timestamp…

    monthly { # list [0..1]
      month_day = 0      # number | optional | One day of the month. 1-31 indicates the 1st to the 31st day…

      week_day_of_month { # list [0..1]
        day_of_week  = ""     # string | required | A day of the week. Possible values: ["MONDAY", "TUESDAY", "W…
        week_ordinal = 0      # number | required | Week number in a month. 1-4 indicates the 1st to 4th week of…
        day_offset   = 0      # number | optional | Represents the number of days before or after the given week…

      }

    }

    time_of_day { # list [1..1]
      hours   = 0      # number | optional | Hours of day in 24 hour format. Should be from 0 to 23. An A…
      minutes = 0      # number | optional | Minutes of hour of day. Must be from 0 to 59.
      nanos   = 0      # number | optional | Fractions of seconds in nanoseconds. Must be from 0 to 999,9…
      seconds = 0      # number | optional | Seconds of minutes of the time. Must normally be from 0 to 5…

    }

    time_zone { # list [1..1]
      id      = ""     # string | required | IANA Time Zone Database time zone, e.g. "America/New_York".
      version = ""     # string | optional | IANA Time Zone Database version number, e.g. "2019a".

    }

    weekly { # list [0..1]
      day_of_week = ""     # string | required | IANA Time Zone Database time zone, e.g. "America/New_York". …

    }

  }

  rollout { # list [0..1]
    mode = ""     # string | required | Mode of the patch rollout. Possible values: ["ZONE_BY_ZONE",…

    disruption_budget { # list [1..1]
      fixed      = 0      # number | optional | Specifies a fixed value.
      percentage = 0      # number | optional | Specifies the relative value defined as a percentage, which …

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}


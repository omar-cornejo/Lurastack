# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_bigtable_gc_policy                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_bigtable_gc_policy" "this" {

  column_family   = ""     # string | required | The name of the column family.
  instance_name   = ""     # string | required | The name of the Bigtable instance.
  table           = ""     # string | required | The name of the table.
  deletion_policy = ""     # string | optional | The deletion policy for the GC policy. Setting ABANDON allow…
  gc_rules        = ""     # string | optional | Serialized JSON string for garbage collection policy. Confli…
  id              = ""     # string | optional+computed
  ignore_warnings = false  # bool | optional | Allows ignoring warnings when updating the GC policy. This c…
  mode            = ""     # string | optional | NOTE: 'gc_rules' is more flexible, and should be preferred o…
  project         = ""     # string | optional+computed | The ID of the project in which the resource belongs. If it i…

  max_age { # list [0..1]
    days     = 0      # number | optional+computed+DEPRECATED | Number of days before applying GC policy.
    duration = ""     # string | optional+computed | Duration before applying GC policy

  }

  max_version { # list
    number = 0      # number | required | Number of version before applying the GC policy.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}


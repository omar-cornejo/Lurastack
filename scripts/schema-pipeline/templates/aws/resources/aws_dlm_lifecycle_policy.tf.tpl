# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dlm_lifecycle_policy                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dlm_lifecycle_policy" "this" {

  description        = ""     # string | required
  execution_role_arn = ""     # string | required
  id                 = ""     # string | optional+computed
  state              = ""     # string | optional
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed

  policy_details { # list [1..1]
    policy_type        = ""     # string | optional
    resource_locations = []     # list(string) | optional+computed
    resource_types     = []     # list(string) | optional
    target_tags        = {}     # map(string) | optional

    action { # list [0..1]
      name = ""     # string | required

      cross_region_copy { # set [1..3]
        target = ""     # string | required

        encryption_configuration { # list [1..1]
          cmk_arn   = ""     # string | optional
          encrypted = false  # bool | optional

        }

        retain_rule { # list [0..1]
          interval      = 0      # number | required
          interval_unit = ""     # string | required

        }

      }

    }

    event_source { # list [0..1]
      type = ""     # string | required

      parameters { # list [1..1]
        description_regex = ""     # string | required
        event_type        = ""     # string | required
        snapshot_owner    = []     # set(string) | required

      }

    }

    parameters { # list [0..1]
      exclude_boot_volume = false  # bool | optional
      no_reboot           = false  # bool | optional

    }

    schedule { # list [0..4]
      name          = ""     # string | required
      copy_tags     = false  # bool | optional+computed
      tags_to_add   = {}     # map(string) | optional
      variable_tags = {}     # map(string) | optional

      create_rule { # list [1..1]
        cron_expression = ""     # string | optional
        interval        = 0      # number | optional
        interval_unit   = ""     # string | optional+computed
        location        = ""     # string | optional+computed
        times           = []     # list(string) | optional+computed

      }

      cross_region_copy_rule { # set [0..3]
        encrypted = false  # bool | required
        target    = ""     # string | required
        cmk_arn   = ""     # string | optional
        copy_tags = false  # bool | optional+computed

        deprecate_rule { # list [0..1]
          interval      = 0      # number | required
          interval_unit = ""     # string | required

        }

        retain_rule { # list [0..1]
          interval      = 0      # number | required
          interval_unit = ""     # string | required

        }

      }

      deprecate_rule { # list [0..1]
        count         = 0      # number | optional
        interval      = 0      # number | optional
        interval_unit = ""     # string | optional

      }

      fast_restore_rule { # list [0..1]
        availability_zones = []     # set(string) | required
        count              = 0      # number | optional
        interval           = 0      # number | optional
        interval_unit      = ""     # string | optional

      }

      retain_rule { # list [1..1]
        count         = 0      # number | optional
        interval      = 0      # number | optional
        interval_unit = ""     # string | optional

      }

      share_rule { # list [0..1]
        target_accounts       = []     # set(string) | required
        unshare_interval      = 0      # number | optional
        unshare_interval_unit = ""     # string | optional

      }

    }

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_opsworks_haproxy_layer                          │
# └──────────────────────────────────────────────────────────────┘
# ⚠ DEPRECATED: this resource type is deprecated
resource "aws_opsworks_haproxy_layer" "this" {

  stack_id                    = ""     # string | required
  stats_password              = ""     # string | required
  auto_assign_elastic_ips     = false  # bool | optional
  auto_assign_public_ips      = false  # bool | optional
  auto_healing                = false  # bool | optional
  custom_configure_recipes    = []     # list(string) | optional
  custom_deploy_recipes       = []     # list(string) | optional
  custom_instance_profile_arn = ""     # string | optional
  custom_json                 = ""     # string | optional
  custom_security_group_ids   = []     # set(string) | optional
  custom_setup_recipes        = []     # list(string) | optional
  custom_shutdown_recipes     = []     # list(string) | optional
  custom_undeploy_recipes     = []     # list(string) | optional
  drain_elb_on_shutdown       = false  # bool | optional
  elastic_load_balancer       = ""     # string | optional
  healthcheck_method          = ""     # string | optional
  healthcheck_url             = ""     # string | optional
  id                          = ""     # string | optional+computed
  install_updates_on_boot     = false  # bool | optional
  instance_shutdown_timeout   = 0      # number | optional
  name                        = ""     # string | optional
  stats_enabled               = false  # bool | optional
  stats_url                   = ""     # string | optional
  stats_user                  = ""     # string | optional
  system_packages             = []     # set(string) | optional
  tags                        = {}     # map(string) | optional
  tags_all                    = {}     # map(string) | optional+computed
  use_ebs_optimized_instances = false  # bool | optional

  # arn                         = ""     # string | computed

  cloudwatch_configuration { # list [0..1]
    enabled = false  # bool | optional

    log_streams { # list
      file                    = ""     # string | required
      log_group_name          = ""     # string | required
      batch_count             = 0      # number | optional
      batch_size              = 0      # number | optional
      buffer_duration         = 0      # number | optional
      datetime_format         = ""     # string | optional
      encoding                = ""     # string | optional
      file_fingerprint_lines  = ""     # string | optional
      initial_position        = ""     # string | optional
      multiline_start_pattern = ""     # string | optional
      time_zone               = ""     # string | optional

    }

  }

  ebs_volume { # set
    mount_point     = ""     # string | required
    number_of_disks = 0      # number | required
    size            = 0      # number | required
    encrypted       = false  # bool | optional
    iops            = 0      # number | optional
    raid_level      = ""     # string | optional
    type            = ""     # string | optional

  }

  load_based_auto_scaling { # list [0..1]
    enable = false  # bool | optional

    downscaling { # list [0..1]
      alarms               = []     # list(string) | optional
      cpu_threshold        = 0      # number | optional
      ignore_metrics_time  = 0      # number | optional
      instance_count       = 0      # number | optional
      load_threshold       = 0      # number | optional
      memory_threshold     = 0      # number | optional
      thresholds_wait_time = 0      # number | optional

    }

    upscaling { # list [0..1]
      alarms               = []     # list(string) | optional
      cpu_threshold        = 0      # number | optional
      ignore_metrics_time  = 0      # number | optional
      instance_count       = 0      # number | optional
      load_threshold       = 0      # number | optional
      memory_threshold     = 0      # number | optional
      thresholds_wait_time = 0      # number | optional

    }

  }

}


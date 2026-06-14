# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_batch_job_definition                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_batch_job_definition" "this" {

  name                       = ""     # string | required
  type                       = ""     # string | required
  container_properties       = ""     # string | optional
  deregister_on_new_revision = false  # bool | optional
  ecs_properties             = ""     # string | optional
  id                         = ""     # string | optional+computed
  node_properties            = ""     # string | optional
  parameters                 = {}     # map(string) | optional
  platform_capabilities      = []     # set(string) | optional
  propagate_tags             = false  # bool | optional
  scheduling_priority        = 0      # number | optional
  tags                       = {}     # map(string) | optional
  tags_all                   = {}     # map(string) | optional+computed

  # arn                        = ""     # string | computed
  # arn_prefix                 = ""     # string | computed
  # revision                   = 0      # number | computed

  eks_properties { # list [0..1]

    pod_properties { # list [1..1]
      dns_policy              = ""     # string | optional
      host_network            = false  # bool | optional
      service_account_name    = ""     # string | optional
      share_process_namespace = false  # bool | optional

      containers { # list [1..10]
        image             = ""     # string | required
        args              = []     # list(string) | optional
        command           = []     # list(string) | optional
        image_pull_policy = ""     # string | optional
        name              = ""     # string | optional

        env { # set
          name  = ""     # string | required
          value = ""     # string | required

        }

        resources { # list [0..1]
          limits   = {}     # map(string) | optional
          requests = {}     # map(string) | optional

        }

        security_context { # list [0..1]
          privileged                 = false  # bool | optional
          read_only_root_file_system = false  # bool | optional
          run_as_group               = 0      # number | optional
          run_as_non_root            = false  # bool | optional
          run_as_user                = 0      # number | optional

        }

        volume_mounts { # list
          mount_path = ""     # string | required
          name       = ""     # string | required
          read_only  = false  # bool | optional

        }

      }

      image_pull_secret { # list
        name = ""     # string | required

      }

      init_containers { # list [0..10]
        image             = ""     # string | required
        args              = []     # list(string) | optional
        command           = []     # list(string) | optional
        image_pull_policy = ""     # string | optional
        name              = ""     # string | optional

        env { # set
          name  = ""     # string | required
          value = ""     # string | required

        }

        resources { # list [0..1]
          limits   = {}     # map(string) | optional
          requests = {}     # map(string) | optional

        }

        security_context { # list [0..1]
          privileged                 = false  # bool | optional
          read_only_root_file_system = false  # bool | optional
          run_as_group               = 0      # number | optional
          run_as_non_root            = false  # bool | optional
          run_as_user                = 0      # number | optional

        }

        volume_mounts { # list
          mount_path = ""     # string | required
          name       = ""     # string | required
          read_only  = false  # bool | optional

        }

      }

      metadata { # list [0..1]
        labels = {}     # map(string) | optional

      }

      volumes { # list
        name = ""     # string | optional

        empty_dir { # list [0..1]
          size_limit = ""     # string | required
          medium     = ""     # string | optional

        }

        host_path { # list [0..1]
          path = ""     # string | required

        }

        secret { # list [0..1]
          secret_name = ""     # string | required
          optional    = false  # bool | optional

        }

      }

    }

  }

  retry_strategy { # list [0..1]
    attempts = 0      # number | optional

    evaluate_on_exit { # list [0..5]
      action           = ""     # string | required
      on_exit_code     = ""     # string | optional
      on_reason        = ""     # string | optional
      on_status_reason = ""     # string | optional

    }

  }

  timeout { # list [0..1]
    attempt_duration_seconds = 0      # number | optional

  }

}


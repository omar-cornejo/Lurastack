# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_batch_compute_environment                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_batch_compute_environment" "this" {

  type                            = ""     # string | required
  compute_environment_name        = ""     # string | optional+computed
  compute_environment_name_prefix = ""     # string | optional+computed
  id                              = ""     # string | optional+computed
  service_role                    = ""     # string | optional+computed
  state                           = ""     # string | optional
  tags                            = {}     # map(string) | optional
  tags_all                        = {}     # map(string) | optional+computed

  # arn                             = ""     # string | computed
  # ecs_cluster_arn                 = ""     # string | computed
  # status                          = ""     # string | computed
  # status_reason                   = ""     # string | computed

  compute_resources { # list [0..1]
    max_vcpus           = 0      # number | required
    subnets             = []     # set(string) | required
    type                = ""     # string | required
    allocation_strategy = ""     # string | optional
    bid_percentage      = 0      # number | optional
    desired_vcpus       = 0      # number | optional+computed
    ec2_key_pair        = ""     # string | optional
    image_id            = ""     # string | optional
    instance_role       = ""     # string | optional
    instance_type       = []     # set(string) | optional
    min_vcpus           = 0      # number | optional
    placement_group     = ""     # string | optional
    security_group_ids  = []     # set(string) | optional
    spot_iam_fleet_role = ""     # string | optional
    tags                = {}     # map(string) | optional

    ec2_configuration { # list [0..2]
      image_id_override = ""     # string | optional+computed
      image_type        = ""     # string | optional

    }

    launch_template { # list [0..1]
      launch_template_id   = ""     # string | optional
      launch_template_name = ""     # string | optional
      version              = ""     # string | optional+computed

    }

  }

  eks_configuration { # list [0..1]
    eks_cluster_arn      = ""     # string | required
    kubernetes_namespace = ""     # string | required

  }

  update_policy { # list [0..1]
    job_execution_timeout_minutes = 0      # number | required
    terminate_jobs_on_update      = false  # bool | required

  }

}


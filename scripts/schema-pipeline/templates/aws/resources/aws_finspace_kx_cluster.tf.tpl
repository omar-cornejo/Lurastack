# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_finspace_kx_cluster                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_finspace_kx_cluster" "this" {

  az_mode                 = ""     # string | required
  environment_id          = ""     # string | required
  name                    = ""     # string | required
  release_label           = ""     # string | required
  type                    = ""     # string | required
  availability_zone_id    = ""     # string | optional
  command_line_arguments  = {}     # map(string) | optional
  description             = ""     # string | optional
  execution_role          = ""     # string | optional
  id                      = ""     # string | optional+computed
  initialization_script   = ""     # string | optional
  tags                    = {}     # map(string) | optional
  tags_all                = {}     # map(string) | optional+computed

  # arn                     = ""     # string | computed
  # created_timestamp       = ""     # string | computed
  # last_modified_timestamp = ""     # string | computed
  # status                  = ""     # string | computed
  # status_reason           = ""     # string | computed

  auto_scaling_configuration { # list [0..1]
    auto_scaling_metric        = ""     # string | required
    max_node_count             = 0      # number | required
    metric_target              = 0      # number | required
    min_node_count             = 0      # number | required
    scale_in_cooldown_seconds  = 0      # number | required
    scale_out_cooldown_seconds = 0      # number | required

  }

  cache_storage_configurations { # list
    size = 0      # number | required
    type = ""     # string | required

  }

  capacity_configuration { # list [0..1]
    node_count = 0      # number | required
    node_type  = ""     # string | required

  }

  code { # list [0..1]
    s3_bucket         = ""     # string | required
    s3_key            = ""     # string | required
    s3_object_version = ""     # string | optional

  }

  database { # list
    database_name = ""     # string | required
    changeset_id  = ""     # string | optional
    dataview_name = ""     # string | optional

    cache_configurations { # list
      cache_type = ""     # string | required
      db_paths   = []     # set(string) | optional

    }

  }

  savedown_storage_configuration { # list [0..1]
    size        = 0      # number | optional
    type        = ""     # string | optional
    volume_name = ""     # string | optional

  }

  scaling_group_configuration { # list [0..1]
    memory_reservation = 0      # number | required
    node_count         = 0      # number | required
    scaling_group_name = ""     # string | required
    cpu                = 0      # number | optional
    memory_limit       = 0      # number | optional

  }

  tickerplant_log_configuration { # list
    tickerplant_log_volumes = []     # set(string) | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  vpc_configuration { # list [1..1]
    ip_address_type    = ""     # string | required
    security_group_ids = []     # set(string) | required
    subnet_ids         = []     # set(string) | required
    vpc_id             = ""     # string | required

  }

}


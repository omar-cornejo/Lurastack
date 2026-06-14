# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_glue_job                                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_glue_job" "this" {

  name                      = ""     # string | required
  role_arn                  = ""     # string | required
  connections               = []     # list(string) | optional
  default_arguments         = {}     # map(string) | optional
  description               = ""     # string | optional
  execution_class           = ""     # string | optional
  glue_version              = ""     # string | optional+computed
  id                        = ""     # string | optional+computed
  job_run_queuing_enabled   = false  # bool | optional
  maintenance_window        = ""     # string | optional
  max_capacity              = 0      # number | optional+computed
  max_retries               = 0      # number | optional
  non_overridable_arguments = {}     # map(string) | optional
  number_of_workers         = 0      # number | optional+computed
  security_configuration    = ""     # string | optional
  tags                      = {}     # map(string) | optional
  tags_all                  = {}     # map(string) | optional+computed
  timeout                   = 0      # number | optional+computed
  worker_type               = ""     # string | optional+computed

  # arn                       = ""     # string | computed

  command { # list [1..1]
    script_location = ""     # string | required
    name            = ""     # string | optional
    python_version  = ""     # string | optional+computed
    runtime         = ""     # string | optional+computed

  }

  execution_property { # list [0..1]
    max_concurrent_runs = 0      # number | optional

  }

  notification_property { # list [0..1]
    notify_delay_after = 0      # number | optional

  }

  source_control_details { # list [0..1]
    auth_strategy  = ""     # string | optional
    auth_token     = ""     # string | optional+sensitive
    branch         = ""     # string | optional
    folder         = ""     # string | optional
    last_commit_id = ""     # string | optional
    owner          = ""     # string | optional
    provider       = ""     # string | optional
    repository     = ""     # string | optional

  }

}


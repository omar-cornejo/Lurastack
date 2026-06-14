# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_batch_job_queue                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_batch_job_queue" "this" {

  name                  = ""     # string | required
  priority              = 0      # number | required
  state                 = ""     # string | required
  compute_environments  = []     # list(string) | optional+DEPRECATED
  scheduling_policy_arn = ""     # string | optional
  tags                  = {}     # map(string) | optional

  # arn                   = ""     # string | computed
  # id                    = ""     # string | computed
  # tags_all              = {}     # map(string) | computed

  compute_environment_order { # list
    compute_environment = ""     # string | required
    order               = 0      # number | required

  }

  job_state_time_limit_action { # list
    action           = ""     # string | required
    max_time_seconds = 0      # number | required
    reason           = ""     # string | required
    state            = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_glue_trigger                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_glue_trigger" "this" {

  name              = ""     # string | required
  type              = ""     # string | required
  description       = ""     # string | optional
  enabled           = false  # bool | optional
  id                = ""     # string | optional+computed
  schedule          = ""     # string | optional
  start_on_creation = false  # bool | optional
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed
  workflow_name     = ""     # string | optional

  # arn               = ""     # string | computed
  # state             = ""     # string | computed

  actions { # list [1..*]
    arguments              = {}     # map(string) | optional
    crawler_name           = ""     # string | optional
    job_name               = ""     # string | optional
    security_configuration = ""     # string | optional
    timeout                = 0      # number | optional

    notification_property { # list [0..1]
      notify_delay_after = 0      # number | optional

    }

  }

  event_batching_condition { # list
    batch_size   = 0      # number | required
    batch_window = 0      # number | optional

  }

  predicate { # list [0..1]
    logical = ""     # string | optional

    conditions { # list [1..*]
      crawl_state      = ""     # string | optional
      crawler_name     = ""     # string | optional
      job_name         = ""     # string | optional
      logical_operator = ""     # string | optional
      state            = ""     # string | optional

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


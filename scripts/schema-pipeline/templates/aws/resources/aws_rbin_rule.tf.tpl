# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_rbin_rule                                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_rbin_rule" "this" {

  resource_type = ""     # string | required
  description   = ""     # string | optional+computed
  tags          = {}     # map(string) | optional
  tags_all      = {}     # map(string) | optional+computed

  # arn           = ""     # string | computed
  # id            = ""     # string | computed
  # lock_end_time = ""     # string | computed
  # lock_state    = ""     # string | computed
  # status        = ""     # string | computed

  lock_configuration { # list [0..1]

    unlock_delay { # list [1..1]
      unlock_delay_unit  = ""     # string | required
      unlock_delay_value = 0      # number | required

    }

  }

  resource_tags { # set [0..50]
    resource_tag_key   = ""     # string | required
    resource_tag_value = ""     # string | optional

  }

  retention_period { # list [1..1]
    retention_period_unit  = ""     # string | required
    retention_period_value = 0      # number | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


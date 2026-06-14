# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_evidently_launch                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_evidently_launch" "this" {

  name               = ""     # string | required
  project            = ""     # string | required
  description        = ""     # string | optional
  id                 = ""     # string | optional+computed
  randomization_salt = ""     # string | optional
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed
  # created_time       = ""     # string | computed
  # execution = [  # list(object)
  #   {
  #     ended_time = ""
  #     started_time = ""
  #   }
  # ]
  # last_updated_time  = ""     # string | computed
  # status             = ""     # string | computed
  # status_reason      = ""     # string | computed
  # type               = ""     # string | computed

  groups { # list [1..5]
    feature     = ""     # string | required
    name        = ""     # string | required
    variation   = ""     # string | required
    description = ""     # string | optional

  }

  metric_monitors { # list [0..3]

    metric_definition { # list [1..1]
      entity_id_key = ""     # string | required
      name          = ""     # string | required
      value_key     = ""     # string | required
      event_pattern = ""     # string | optional
      unit_label    = ""     # string | optional

    }

  }

  scheduled_splits_config { # list [0..1]

    steps { # list [1..6]
      group_weights = {}     # map(number) | required
      start_time    = ""     # string | required

      segment_overrides { # list [0..6]
        evaluation_order = 0      # number | required
        segment          = ""     # string | required
        weights          = {}     # map(number) | required

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


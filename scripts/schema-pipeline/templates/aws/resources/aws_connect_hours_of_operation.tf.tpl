# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_connect_hours_of_operation                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_connect_hours_of_operation" "this" {

  instance_id           = ""     # string | required
  name                  = ""     # string | required
  time_zone             = ""     # string | required
  description           = ""     # string | optional
  id                    = ""     # string | optional+computed
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed

  # arn                   = ""     # string | computed
  # hours_of_operation_id = ""     # string | computed

  config { # set [1..*]
    day = ""     # string | required

    end_time { # list [1..1]
      hours   = 0      # number | required
      minutes = 0      # number | required

    }

    start_time { # list [1..1]
      hours   = 0      # number | required
      minutes = 0      # number | required

    }

  }

}


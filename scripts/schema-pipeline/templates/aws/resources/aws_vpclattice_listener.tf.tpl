# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpclattice_listener                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpclattice_listener" "this" {

  name               = ""     # string | required
  protocol           = ""     # string | required
  id                 = ""     # string | optional+computed
  port               = 0      # number | optional+computed
  service_arn        = ""     # string | optional+computed
  service_identifier = ""     # string | optional+computed
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed
  # created_at         = ""     # string | computed
  # last_updated_at    = ""     # string | computed
  # listener_id        = ""     # string | computed

  default_action { # list [1..1]

    fixed_response { # list [0..1]
      status_code = 0      # number | required

    }

    forward { # list

      target_groups { # list
        target_group_identifier = ""     # string | optional
        weight                  = 0      # number | optional

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


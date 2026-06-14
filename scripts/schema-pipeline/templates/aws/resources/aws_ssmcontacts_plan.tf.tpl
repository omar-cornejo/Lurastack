# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssmcontacts_plan                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssmcontacts_plan" "this" {

  contact_id = ""     # string | required
  id         = ""     # string | optional+computed

  stage { # list [1..*]
    duration_in_minutes = 0      # number | required

    target { # list

      channel_target_info { # list [0..1]
        contact_channel_id        = ""     # string | required
        retry_interval_in_minutes = 0      # number | optional

      }

      contact_target_info { # list [0..1]
        is_essential = false  # bool | required
        contact_id   = ""     # string | optional

      }

    }

  }

}


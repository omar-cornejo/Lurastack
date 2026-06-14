# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_connect_quick_connect                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_connect_quick_connect" "this" {

  instance_id      = ""     # string | required
  name             = ""     # string | required
  description      = ""     # string | optional
  id               = ""     # string | optional+computed
  tags             = {}     # map(string) | optional
  tags_all         = {}     # map(string) | optional+computed

  # arn              = ""     # string | computed
  # quick_connect_id = ""     # string | computed

  quick_connect_config { # list [1..1]
    quick_connect_type = ""     # string | required

    phone_config { # list
      phone_number = ""     # string | required

    }

    queue_config { # list
      contact_flow_id = ""     # string | required
      queue_id        = ""     # string | required

    }

    user_config { # list
      contact_flow_id = ""     # string | required
      user_id         = ""     # string | required

    }

  }

}


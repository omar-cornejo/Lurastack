# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshift_scheduled_action                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshift_scheduled_action" "this" {

  iam_role    = ""     # string | required
  name        = ""     # string | required
  schedule    = ""     # string | required
  description = ""     # string | optional
  enable      = false  # bool | optional
  end_time    = ""     # string | optional
  id          = ""     # string | optional+computed
  start_time  = ""     # string | optional

  target_action { # list [1..1]

    pause_cluster { # list [0..1]
      cluster_identifier = ""     # string | required

    }

    resize_cluster { # list [0..1]
      cluster_identifier = ""     # string | required
      classic            = false  # bool | optional
      cluster_type       = ""     # string | optional
      node_type          = ""     # string | optional
      number_of_nodes    = 0      # number | optional

    }

    resume_cluster { # list [0..1]
      cluster_identifier = ""     # string | required

    }

  }

}


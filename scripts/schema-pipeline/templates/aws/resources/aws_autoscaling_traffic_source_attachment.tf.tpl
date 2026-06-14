# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_autoscaling_traffic_source_attachment           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_autoscaling_traffic_source_attachment" "this" {

  autoscaling_group_name = ""     # string | required
  id                     = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

  traffic_source { # list [0..1]
    identifier = ""     # string | required
    type       = ""     # string | required

  }

}


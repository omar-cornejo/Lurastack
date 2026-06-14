# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_oam_link                                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_oam_link" "this" {

  label_template  = ""     # string | required
  resource_types  = []     # set(string) | required
  sink_identifier = ""     # string | required
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed
  # label           = ""     # string | computed
  # link_id         = ""     # string | computed
  # sink_arn        = ""     # string | computed

  link_configuration { # list [0..1]

    log_group_configuration { # list [0..1]
      filter = ""     # string | required

    }

    metric_configuration { # list [0..1]
      filter = ""     # string | required

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


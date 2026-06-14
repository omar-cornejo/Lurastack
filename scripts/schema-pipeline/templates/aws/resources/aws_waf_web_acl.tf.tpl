# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_waf_web_acl                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_waf_web_acl" "this" {

  metric_name = ""     # string | required
  name        = ""     # string | required
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed

  default_action { # list [1..1]
    type = ""     # string | required

  }

  logging_configuration { # list [0..1]
    log_destination = ""     # string | required

    redacted_fields { # list [0..1]

      field_to_match { # set [1..*]
        type = ""     # string | required
        data = ""     # string | optional

      }

    }

  }

  rules { # set
    priority = 0      # number | required
    rule_id  = ""     # string | required
    type     = ""     # string | optional

    action { # list [0..1]
      type = ""     # string | required

    }

    override_action { # list [0..1]
      type = ""     # string | required

    }

  }

}


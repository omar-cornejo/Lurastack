# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssmincidents_response_plan                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssmincidents_response_plan" "this" {

  name         = ""     # string | required
  chat_channel = []     # set(string) | optional
  display_name = ""     # string | optional
  engagements  = []     # set(string) | optional
  id           = ""     # string | optional+computed
  tags         = {}     # map(string) | optional
  tags_all     = {}     # map(string) | optional+computed

  # arn          = ""     # string | computed

  action { # list [0..1]

    ssm_automation { # list
      document_name      = ""     # string | required
      role_arn           = ""     # string | required
      document_version   = ""     # string | optional
      dynamic_parameters = {}     # map(string) | optional
      target_account     = ""     # string | optional

      parameter { # set
        name   = ""     # string | required
        values = []     # set(string) | required

      }

    }

  }

  incident_template { # list [1..1]
    impact        = 0      # number | required
    title         = ""     # string | required
    dedupe_string = ""     # string | optional
    incident_tags = {}     # map(string) | optional
    summary       = ""     # string | optional

    notification_target { # set
      sns_topic_arn = ""     # string | required

    }

  }

  integration { # list [0..1]

    pagerduty { # list
      name       = ""     # string | required
      secret_id  = ""     # string | required
      service_id = ""     # string | required

    }

  }

}


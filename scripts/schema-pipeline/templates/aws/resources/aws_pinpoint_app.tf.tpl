# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_pinpoint_app                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_pinpoint_app" "this" {

  id             = ""     # string | optional+computed
  name           = ""     # string | optional+computed
  name_prefix    = ""     # string | optional+computed
  tags           = {}     # map(string) | optional
  tags_all       = {}     # map(string) | optional+computed

  # application_id = ""     # string | computed
  # arn            = ""     # string | computed

  campaign_hook { # list [0..1]
    lambda_function_name = ""     # string | optional
    mode                 = ""     # string | optional
    web_url              = ""     # string | optional

  }

  limits { # list [0..1]
    daily               = 0      # number | optional
    maximum_duration    = 0      # number | optional
    messages_per_second = 0      # number | optional
    total               = 0      # number | optional

  }

  quiet_time { # list [0..1]
    end   = ""     # string | optional
    start = ""     # string | optional

  }

}


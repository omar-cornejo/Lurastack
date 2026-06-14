# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_devopsguru_event_sources_config                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_devopsguru_event_sources_config" "this" {


  # id = ""     # string | computed

  event_sources { # list

    amazon_code_guru_profiler { # list
      status = ""     # string | required

    }

  }

}


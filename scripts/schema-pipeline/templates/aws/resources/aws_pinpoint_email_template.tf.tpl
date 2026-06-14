# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_pinpoint_email_template                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_pinpoint_email_template" "this" {

  template_name = ""     # string | required
  tags          = {}     # map(string) | optional

  # arn           = ""     # string | computed
  # tags_all      = {}     # map(string) | computed

  email_template { # list
    default_substitutions = ""     # string | optional
    description           = ""     # string | optional
    html_part             = ""     # string | optional
    recommender_id        = ""     # string | optional
    subject               = ""     # string | optional
    text_part             = ""     # string | optional

    header { # list
      name  = ""     # string | optional
      value = ""     # string | optional

    }

  }

}


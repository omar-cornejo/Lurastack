# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_auditmanager_control                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_auditmanager_control" "this" {

  name                     = ""     # string | required
  action_plan_instructions = ""     # string | optional
  action_plan_title        = ""     # string | optional
  description              = ""     # string | optional
  tags                     = {}     # map(string) | optional
  testing_information      = ""     # string | optional

  # arn                      = ""     # string | computed
  # id                       = ""     # string | computed
  # tags_all                 = {}     # map(string) | computed
  # type                     = ""     # string | computed

  control_mapping_sources { # set
    source_name          = ""     # string | required
    source_set_up_option = ""     # string | required
    source_type          = ""     # string | required
    source_description   = ""     # string | optional
    source_frequency     = ""     # string | optional
    troubleshooting_text = ""     # string | optional

    # source_id            = ""     # string | computed

    source_keyword { # list
      keyword_input_type = ""     # string | required
      keyword_value      = ""     # string | required

    }

  }

}


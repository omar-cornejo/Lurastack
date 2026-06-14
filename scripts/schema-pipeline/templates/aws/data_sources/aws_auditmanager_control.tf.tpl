# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_auditmanager_control                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_auditmanager_control" "this" {

  name                     = ""     # string | required
  type                     = ""     # string | required

  # action_plan_instructions = ""     # string | computed
  # action_plan_title        = ""     # string | computed
  # arn                      = ""     # string | computed
  # description              = ""     # string | computed
  # id                       = ""     # string | computed
  # tags                     = {}     # map(string) | computed
  # testing_information      = ""     # string | computed

  control_mapping_sources { # set

    # source_description   = ""     # string | computed
    # source_frequency     = ""     # string | computed
    # source_id            = ""     # string | computed
    # source_name          = ""     # string | computed
    # source_set_up_option = ""     # string | computed
    # source_type          = ""     # string | computed
    # troubleshooting_text = ""     # string | computed

    source_keyword { # list

      # keyword_input_type = ""     # string | computed
      # keyword_value      = ""     # string | computed

    }

  }

}


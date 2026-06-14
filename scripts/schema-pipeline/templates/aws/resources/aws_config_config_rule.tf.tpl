# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_config_config_rule                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_config_config_rule" "this" {

  name                        = ""     # string | required
  description                 = ""     # string | optional
  id                          = ""     # string | optional+computed
  input_parameters            = ""     # string | optional
  maximum_execution_frequency = ""     # string | optional
  tags                        = {}     # map(string) | optional
  tags_all                    = {}     # map(string) | optional+computed

  # arn                         = ""     # string | computed
  # rule_id                     = ""     # string | computed

  evaluation_mode { # set
    mode = ""     # string | optional+computed

  }

  scope { # list [0..1]
    compliance_resource_id    = ""     # string | optional
    compliance_resource_types = []     # set(string) | optional
    tag_key                   = ""     # string | optional
    tag_value                 = ""     # string | optional

  }

  source { # list [1..1]
    owner             = ""     # string | required
    source_identifier = ""     # string | optional

    custom_policy_details { # list [0..1]
      policy_runtime            = ""     # string | required
      policy_text               = ""     # string | required
      enable_debug_log_delivery = false  # bool | optional

    }

    source_detail { # set [0..25]
      event_source                = ""     # string | optional
      maximum_execution_frequency = ""     # string | optional
      message_type                = ""     # string | optional

    }

  }

}


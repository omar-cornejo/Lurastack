# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_flow_definition                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_flow_definition" "this" {

  flow_definition_name = ""     # string | required
  role_arn             = ""     # string | required
  id                   = ""     # string | optional+computed
  tags                 = {}     # map(string) | optional
  tags_all             = {}     # map(string) | optional+computed

  # arn                  = ""     # string | computed

  human_loop_activation_config { # list [0..1]

    human_loop_activation_conditions_config { # list [0..1]
      human_loop_activation_conditions = ""     # string | required

    }

  }

  human_loop_config { # list [1..1]
    human_task_ui_arn                     = ""     # string | required
    task_count                            = 0      # number | required
    task_description                      = ""     # string | required
    task_title                            = ""     # string | required
    workteam_arn                          = ""     # string | required
    task_availability_lifetime_in_seconds = 0      # number | optional
    task_keywords                         = []     # set(string) | optional
    task_time_limit_in_seconds            = 0      # number | optional

    public_workforce_task_price { # list [0..1]

      amount_in_usd { # list [0..1]
        cents                     = 0      # number | optional
        dollars                   = 0      # number | optional
        tenth_fractions_of_a_cent = 0      # number | optional

      }

    }

  }

  human_loop_request_source { # list [0..1]
    aws_managed_human_loop_request_source = ""     # string | required

  }

  output_config { # list [1..1]
    s3_output_path = ""     # string | required
    kms_key_id     = ""     # string | optional

  }

}


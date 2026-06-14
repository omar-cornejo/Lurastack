# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_budgets_budget_action                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_budgets_budget_action" "this" {

  action_type        = ""     # string | required
  approval_model     = ""     # string | required
  budget_name        = ""     # string | required
  execution_role_arn = ""     # string | required
  notification_type  = ""     # string | required
  account_id         = ""     # string | optional+computed
  id                 = ""     # string | optional+computed
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # action_id          = ""     # string | computed
  # arn                = ""     # string | computed
  # status             = ""     # string | computed

  action_threshold { # list [1..1]
    action_threshold_type  = ""     # string | required
    action_threshold_value = 0      # number | required

  }

  definition { # list [1..1]

    iam_action_definition { # list [0..1]
      policy_arn = ""     # string | required
      groups     = []     # set(string) | optional
      roles      = []     # set(string) | optional
      users      = []     # set(string) | optional

    }

    scp_action_definition { # list [0..1]
      policy_id  = ""     # string | required
      target_ids = []     # set(string) | required

    }

    ssm_action_definition { # list [0..1]
      action_sub_type = ""     # string | required
      instance_ids    = []     # set(string) | required
      region          = ""     # string | required

    }

  }

  subscriber { # set [1..11]
    address           = ""     # string | required
    subscription_type = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


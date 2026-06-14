# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_workteam                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_workteam" "this" {

  description    = ""     # string | required
  workteam_name  = ""     # string | required
  id             = ""     # string | optional+computed
  tags           = {}     # map(string) | optional
  tags_all       = {}     # map(string) | optional+computed
  workforce_name = ""     # string | optional

  # arn            = ""     # string | computed
  # subdomain      = ""     # string | computed

  member_definition { # list [1..10]

    cognito_member_definition { # list [0..1]
      client_id  = ""     # string | required
      user_group = ""     # string | required
      user_pool  = ""     # string | required

    }

    oidc_member_definition { # list [0..1]
      groups = []     # set(string) | required

    }

  }

  notification_configuration { # list [0..1]
    notification_topic_arn = ""     # string | optional

  }

  worker_access_configuration { # list [0..1]

    s3_presign { # list [0..1]

      iam_policy_constraints { # list [0..1]
        source_ip     = ""     # string | optional+computed
        vpc_source_ip = ""     # string | optional+computed

      }

    }

  }

}


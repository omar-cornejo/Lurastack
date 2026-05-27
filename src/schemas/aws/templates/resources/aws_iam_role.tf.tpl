# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_role                                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_role" "this" {

  assume_role_policy    = ""     # string | required
  description           = ""     # string | optional
  force_detach_policies = false  # bool | optional
  id                    = ""     # string | optional+computed
  managed_policy_arns   = []     # set(string) | optional+computed+DEPRECATED
  max_session_duration  = 0      # number | optional
  name                  = ""     # string | optional+computed
  name_prefix           = ""     # string | optional+computed
  path                  = ""     # string | optional
  permissions_boundary  = ""     # string | optional
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed

  # arn                   = ""     # string | computed
  # create_date           = ""     # string | computed
  # unique_id             = ""     # string | computed

  inline_policy { # set DEPRECATED
    name   = ""     # string | optional
    policy = ""     # string | optional

  }

}


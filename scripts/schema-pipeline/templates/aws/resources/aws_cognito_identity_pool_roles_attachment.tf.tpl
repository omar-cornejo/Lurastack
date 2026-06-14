# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cognito_identity_pool_roles_attachment          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cognito_identity_pool_roles_attachment" "this" {

  identity_pool_id = ""     # string | required
  roles            = {}     # map(string) | required
  id               = ""     # string | optional+computed

  role_mapping { # set
    identity_provider         = ""     # string | required
    type                      = ""     # string | required
    ambiguous_role_resolution = ""     # string | optional

    mapping_rule { # list [0..25]
      claim      = ""     # string | required
      match_type = ""     # string | required
      role_arn   = ""     # string | required
      value      = ""     # string | required

    }

  }

}


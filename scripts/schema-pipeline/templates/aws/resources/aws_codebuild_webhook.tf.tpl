# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codebuild_webhook                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codebuild_webhook" "this" {

  project_name    = ""     # string | required
  branch_filter   = ""     # string | optional
  build_type      = ""     # string | optional
  id              = ""     # string | optional+computed
  manual_creation = false  # bool | optional

  # payload_url     = ""     # string | computed
  # secret          = ""     # string | computed+sensitive
  # url             = ""     # string | computed

  filter_group { # set

    filter { # list
      pattern                 = ""     # string | required
      type                    = ""     # string | required
      exclude_matched_pattern = false  # bool | optional

    }

  }

  scope_configuration { # list [0..1]
    name   = ""     # string | required
    scope  = ""     # string | required
    domain = ""     # string | optional

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssm_patch_baseline                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssm_patch_baseline" "this" {

  name                                 = ""     # string | required
  approved_patches                     = []     # set(string) | optional
  approved_patches_compliance_level    = ""     # string | optional
  approved_patches_enable_non_security = false  # bool | optional
  description                          = ""     # string | optional
  id                                   = ""     # string | optional+computed
  operating_system                     = ""     # string | optional
  rejected_patches                     = []     # set(string) | optional
  rejected_patches_action              = ""     # string | optional+computed
  tags                                 = {}     # map(string) | optional
  tags_all                             = {}     # map(string) | optional+computed

  # arn                                  = ""     # string | computed
  # json                                 = ""     # string | computed

  approval_rule { # list
    approve_after_days  = 0      # number | optional
    approve_until_date  = ""     # string | optional
    compliance_level    = ""     # string | optional
    enable_non_security = false  # bool | optional

    patch_filter { # list [1..10]
      key    = ""     # string | required
      values = []     # list(string) | required

    }

  }

  global_filter { # list [0..4]
    key    = ""     # string | required
    values = []     # list(string) | required

  }

  source { # list [0..20]
    configuration = ""     # string | required
    name          = ""     # string | required
    products      = []     # list(string) | required

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ssm_patch_baseline                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_ssm_patch_baseline" "this" {

  owner                                = ""     # string | required
  default_baseline                     = false  # bool | optional
  id                                   = ""     # string | optional+computed
  name_prefix                          = ""     # string | optional
  operating_system                     = ""     # string | optional

  # approval_rule = [  # list(object)
  #   {
  #     approve_after_days = 0
  #     approve_until_date = ""
  #     compliance_level = ""
  #     enable_non_security = false
  #     patch_filter = [  # list(object)
  #       {
  #         key = ""
  #         values = []  # list(string)
  #       }
  #     ]
  #   }
  # ]
  # approved_patches                     = []     # list(string) | computed
  # approved_patches_compliance_level    = ""     # string | computed
  # approved_patches_enable_non_security = false  # bool | computed
  # description                          = ""     # string | computed
  # global_filter = [  # list(object)
  #   {
  #     key = ""
  #     values = []  # list(string)
  #   }
  # ]
  # json                                 = ""     # string | computed
  # name                                 = ""     # string | computed
  # rejected_patches                     = []     # list(string) | computed
  # rejected_patches_action              = ""     # string | computed
  # source = [  # list(object)
  #   {
  #     configuration = ""
  #     name = ""
  #     products = []  # list(string)
  #   }
  # ]

}


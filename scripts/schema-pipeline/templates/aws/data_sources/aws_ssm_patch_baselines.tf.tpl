# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ssm_patch_baselines                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_ssm_patch_baselines" "this" {

  default_baselines   = false  # bool | optional

  # baseline_identities = [  # list(object)
  #   {
  #     baseline_description = ""
  #     baseline_id = ""
  #     baseline_name = ""
  #     default_baseline = false
  #     operating_system = ""
  #   }
  # ]

  filter { # list
    key    = ""     # string | required
    values = []     # set(string) | required

  }

}


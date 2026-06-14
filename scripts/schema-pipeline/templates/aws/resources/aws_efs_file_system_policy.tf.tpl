# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_efs_file_system_policy                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_efs_file_system_policy" "this" {

  file_system_id                     = ""     # string | required
  policy                             = ""     # string | required
  bypass_policy_lockout_safety_check = false  # bool | optional
  id                                 = ""     # string | optional+computed

}


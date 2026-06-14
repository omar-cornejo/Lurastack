# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssm_patch_group                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssm_patch_group" "this" {

  baseline_id = ""     # string | required
  patch_group = ""     # string | required
  id          = ""     # string | optional+computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssm_default_patch_baseline                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssm_default_patch_baseline" "this" {

  baseline_id      = ""     # string | required
  operating_system = ""     # string | required
  id               = ""     # string | optional+computed

}


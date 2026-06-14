# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ami_launch_permission                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ami_launch_permission" "this" {

  image_id                = ""     # string | required
  account_id              = ""     # string | optional
  group                   = ""     # string | optional
  id                      = ""     # string | optional+computed
  organization_arn        = ""     # string | optional
  organizational_unit_arn = ""     # string | optional

}


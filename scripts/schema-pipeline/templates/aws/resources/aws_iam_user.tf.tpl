# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_user                                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_user" "this" {

  name                 = ""     # string | required
  force_destroy        = false  # bool | optional | Delete user even if it has non-Terraform-managed IAM access …
  id                   = ""     # string | optional+computed
  path                 = ""     # string | optional
  permissions_boundary = ""     # string | optional
  tags                 = {}     # map(string) | optional
  tags_all             = {}     # map(string) | optional+computed

  # arn                  = ""     # string | computed
  # unique_id            = ""     # string | computed

}


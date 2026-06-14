# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_finspace_kx_user                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_finspace_kx_user" "this" {

  environment_id = ""     # string | required
  iam_role       = ""     # string | required
  name           = ""     # string | required
  id             = ""     # string | optional+computed
  tags           = {}     # map(string) | optional
  tags_all       = {}     # map(string) | optional+computed

  # arn            = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_serverlessapplicationrepository_cloudformation_stack  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_serverlessapplicationrepository_cloudformation_stack" "this" {

  application_id   = ""     # string | required
  capabilities     = []     # set(string) | required
  name             = ""     # string | required
  id               = ""     # string | optional+computed
  parameters       = {}     # map(string) | optional+computed
  semantic_version = ""     # string | optional+computed
  tags             = {}     # map(string) | optional
  tags_all         = {}     # map(string) | optional+computed

  # outputs          = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


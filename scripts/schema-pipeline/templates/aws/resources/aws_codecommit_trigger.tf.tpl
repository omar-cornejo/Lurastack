# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codecommit_trigger                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codecommit_trigger" "this" {

  repository_name  = ""     # string | required
  id               = ""     # string | optional+computed

  # configuration_id = ""     # string | computed

  trigger { # set [1..10]
    destination_arn = ""     # string | required
    events          = []     # list(string) | required
    name            = ""     # string | required
    branches        = []     # list(string) | optional
    custom_data     = ""     # string | optional

  }

}


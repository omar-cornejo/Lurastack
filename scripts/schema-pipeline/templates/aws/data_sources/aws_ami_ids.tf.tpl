# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ami_ids                                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_ami_ids" "this" {

  owners             = []     # list(string) | required
  executable_users   = []     # list(string) | optional
  id                 = ""     # string | optional+computed
  include_deprecated = false  # bool | optional
  name_regex         = ""     # string | optional
  sort_ascending     = false  # bool | optional

  # ids                = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}


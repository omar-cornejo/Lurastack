# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_licensemanager_grants                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_licensemanager_grants" "this" {

  id   = ""     # string | optional+computed

  # arns = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

}


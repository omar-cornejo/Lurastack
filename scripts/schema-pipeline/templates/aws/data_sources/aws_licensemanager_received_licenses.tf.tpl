# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_licensemanager_received_licenses                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_licensemanager_received_licenses" "this" {

  id   = ""     # string | optional+computed

  # arns = []     # list(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

}


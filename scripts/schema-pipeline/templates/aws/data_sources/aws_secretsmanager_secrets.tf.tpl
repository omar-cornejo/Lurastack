# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_secretsmanager_secrets                              │
# └──────────────────────────────────────────────────────────────┘
data "aws_secretsmanager_secrets" "this" {

  id    = ""     # string | optional+computed

  # arns  = []     # set(string) | computed
  # names = []     # set(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

}


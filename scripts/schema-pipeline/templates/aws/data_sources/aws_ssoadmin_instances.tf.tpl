# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ssoadmin_instances                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_ssoadmin_instances" "this" {

  id                 = ""     # string | optional+computed

  # arns               = []     # list(string) | computed
  # identity_store_ids = []     # list(string) | computed

}


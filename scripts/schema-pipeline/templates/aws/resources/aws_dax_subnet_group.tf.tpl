# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dax_subnet_group                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dax_subnet_group" "this" {

  name        = ""     # string | required
  subnet_ids  = []     # set(string) | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed

  # vpc_id      = ""     # string | computed

}


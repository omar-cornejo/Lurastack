# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_pricing_product                                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_pricing_product" "this" {

  service_code = ""     # string | required
  id           = ""     # string | optional+computed

  # result       = ""     # string | computed

  filters { # list [1..*]
    field = ""     # string | required
    value = ""     # string | required

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_rds_reserved_instance_offering                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_rds_reserved_instance_offering" "this" {

  db_instance_class   = ""     # string | required
  duration            = 0      # number | required
  multi_az            = false  # bool | required
  offering_type       = ""     # string | required
  product_description = ""     # string | required
  id                  = ""     # string | optional+computed

  # currency_code       = ""     # string | computed
  # fixed_price         = 0      # number | computed
  # offering_id         = ""     # string | computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_rds_reserved_instance                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_rds_reserved_instance" "this" {

  offering_id         = ""     # string | required
  id                  = ""     # string | optional+computed
  instance_count      = 0      # number | optional
  reservation_id      = ""     # string | optional
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed
  # currency_code       = ""     # string | computed
  # db_instance_class   = ""     # string | computed
  # duration            = 0      # number | computed
  # fixed_price         = 0      # number | computed
  # lease_id            = ""     # string | computed
  # multi_az            = false  # bool | computed
  # offering_type       = ""     # string | computed
  # product_description = ""     # string | computed
  # recurring_charges = [  # list(object)
  #   {
  #     recurring_charge_amount = 0
  #     recurring_charge_frequency = ""
  #   }
  # ]
  # start_time          = ""     # string | computed
  # state               = ""     # string | computed
  # usage_price         = 0      # number | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


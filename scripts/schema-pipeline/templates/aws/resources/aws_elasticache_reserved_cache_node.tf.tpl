# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_elasticache_reserved_cache_node                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_elasticache_reserved_cache_node" "this" {

  reserved_cache_nodes_offering_id = ""     # string | required
  cache_node_count                 = 0      # number | optional+computed
  id                               = ""     # string | optional+computed
  tags                             = {}     # map(string) | optional

  # arn                              = ""     # string | computed
  # cache_node_type                  = ""     # string | computed
  # duration                         = ""     # string | computed
  # fixed_price                      = 0      # number | computed
  # offering_type                    = ""     # string | computed
  # product_description              = ""     # string | computed
  # recurring_charges = [  # list(object)
  #   {
  #     recurring_charge_amount = 0
  #     recurring_charge_frequency = ""
  #   }
  # ]
  # start_time                       = ""     # string | computed
  # state                            = ""     # string | computed
  # tags_all                         = {}     # map(string) | computed
  # usage_price                      = 0      # number | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}


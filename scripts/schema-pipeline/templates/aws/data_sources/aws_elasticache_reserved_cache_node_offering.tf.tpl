# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_elasticache_reserved_cache_node_offering            │
# └──────────────────────────────────────────────────────────────┘
data "aws_elasticache_reserved_cache_node_offering" "this" {

  cache_node_type     = ""     # string | required
  duration            = ""     # string | required
  offering_type       = ""     # string | required
  product_description = ""     # string | required

  # fixed_price         = 0      # number | computed
  # offering_id         = ""     # string | computed

}


# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_netblock_ip_ranges                               │
# └──────────────────────────────────────────────────────────────┘
data "google_netblock_ip_ranges" "this" {

  id               = ""     # string | optional+computed
  range_type       = ""     # string | optional

  # cidr_blocks      = []     # list(string) | computed
  # cidr_blocks_ipv4 = []     # list(string) | computed
  # cidr_blocks_ipv6 = []     # list(string) | computed

}


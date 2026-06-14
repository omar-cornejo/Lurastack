# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkmanager_core_network                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkmanager_core_network" "this" {

  global_network_id    = ""     # string | required
  base_policy_document = ""     # string | optional
  base_policy_region   = ""     # string | optional+DEPRECATED
  base_policy_regions  = []     # set(string) | optional
  create_base_policy   = false  # bool | optional
  description          = ""     # string | optional
  id                   = ""     # string | optional+computed
  tags                 = {}     # map(string) | optional
  tags_all             = {}     # map(string) | optional+computed

  # arn                  = ""     # string | computed
  # created_at           = ""     # string | computed
  # edges = [  # list(object)
  #   {
  #     asn = 0
  #     edge_location = ""
  #     inside_cidr_blocks = []  # list(string)
  #   }
  # ]
  # segments = [  # list(object)
  #   {
  #     edge_locations = []  # list(string)
  #     name = ""
  #     shared_segments = []  # list(string)
  #   }
  # ]
  # state                = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


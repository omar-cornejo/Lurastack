# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_networkmanager_connect_peer                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_networkmanager_connect_peer" "this" {

  connect_attachment_id = ""     # string | required
  peer_address          = ""     # string | required
  core_network_address  = ""     # string | optional
  id                    = ""     # string | optional+computed
  inside_cidr_blocks    = []     # list(string) | optional
  subnet_arn            = ""     # string | optional
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed

  # arn                   = ""     # string | computed
  # configuration = [  # list(object)
  #   {
  #     bgp_configurations = [  # list(object)
  #       {
  #         core_network_address = ""
  #         core_network_asn = 0
  #         peer_address = ""
  #         peer_asn = 0
  #       }
  #     ]
  #     core_network_address = ""
  #     inside_cidr_blocks = []  # set(string)
  #     peer_address = ""
  #     protocol = ""
  #   }
  # ]
  # connect_peer_id       = ""     # string | computed
  # core_network_id       = ""     # string | computed
  # created_at            = ""     # string | computed
  # edge_location         = ""     # string | computed
  # state                 = ""     # string | computed

  bgp_options { # list [0..1]
    peer_asn = 0      # number | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_blockchain_node_engine_blockchain_nodes      │
# └──────────────────────────────────────────────────────────────┘
resource "google_blockchain_node_engine_blockchain_nodes" "this" {

  blockchain_node_id = ""     # string | required | ID of the requesting object.
  location           = ""     # string | required | Location of Blockchain Node being created.
  blockchain_type    = ""     # string | optional | User-provided key-value pairs Possible values: ["ETHEREUM"]
  id                 = ""     # string | optional+computed
  labels             = {}     # map(string) | optional | User-provided key-value pairs   **Note**: This field is non-…
  project            = ""     # string | optional+computed

  # connection_info = [  # list(object)
  #   {
  #     endpoint_info = [  # list(object)
  #       {
  #         json_rpc_api_endpoint = ""
  #         websockets_api_endpoint = ""
  #       }
  #     ]
  #     service_attachment = ""
  #   }
  # ]
  # create_time        = ""     # string | computed | The timestamp at which the blockchain node was first created…
  # effective_labels   = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # name               = ""     # string | computed | The fully qualified name of the blockchain node. e.g. projec…
  # terraform_labels   = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time        = ""     # string | computed | The timestamp at which the blockchain node was last updated.

  ethereum_details { # list [0..1]
    api_enable_admin     = false  # bool | optional | Enables JSON-RPC access to functions in the admin namespace.…
    api_enable_debug     = false  # bool | optional | Enables JSON-RPC access to functions in the debug namespace.…
    consensus_client     = ""     # string | optional | The consensus client Possible values: ["CONSENSUS_CLIENT_UNS…
    execution_client     = ""     # string | optional | The execution client Possible values: ["EXECUTION_CLIENT_UNS…
    network              = ""     # string | optional | The Ethereum environment being accessed. Possible values: ["…
    node_type            = ""     # string | optional | The type of Ethereum node. Possible values: ["LIGHT", "FULL"…

    # additional_endpoints = [  # list(object)
    #   {
    #     beacon_api_endpoint = ""
    #     beacon_prometheus_metrics_api_endpoint = ""
    #     execution_client_prometheus_metrics_api_endpoint = ""
    #   }
    # ]

    geth_details { # list [0..1]
      garbage_collection_mode = ""     # string | optional | Blockchain garbage collection modes. Only applicable when No…

    }

    validator_config { # list [0..1]
      mev_relay_urls = []     # list(string) | optional | URLs for MEV-relay services to use for block building. When …

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


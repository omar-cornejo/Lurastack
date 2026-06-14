# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_opensearch_outbound_connection                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_opensearch_outbound_connection" "this" {

  connection_alias  = ""     # string | required
  accept_connection = false  # bool | optional
  connection_mode   = ""     # string | optional+computed
  id                = ""     # string | optional+computed

  # connection_status = ""     # string | computed

  connection_properties { # list [0..1]

    # endpoint = ""     # string | computed

    cross_cluster_search { # list [0..1]
      skip_unavailable = ""     # string | optional

    }

  }

  local_domain_info { # list [1..1]
    domain_name = ""     # string | required
    owner_id    = ""     # string | required
    region      = ""     # string | required

  }

  remote_domain_info { # list [1..1]
    domain_name = ""     # string | required
    owner_id    = ""     # string | required
    region      = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}


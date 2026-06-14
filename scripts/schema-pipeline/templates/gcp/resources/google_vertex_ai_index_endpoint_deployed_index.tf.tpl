# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_vertex_ai_index_endpoint_deployed_index      │
# └──────────────────────────────────────────────────────────────┘
resource "google_vertex_ai_index_endpoint_deployed_index" "this" {

  deployed_index_id     = ""     # string | required | The user specified ID of the DeployedIndex. The ID can be up…
  index                 = ""     # string | required | The name of the Index this is the deployment of.
  index_endpoint        = ""     # string | required | Identifies the index endpoint. Must be in the format 'projec…
  deployment_group      = ""     # string | optional | The deployment group can be no longer than 64 characters (eg…
  display_name          = ""     # string | optional | The display name of the Index. The name can be up to 128 cha…
  enable_access_logging = false  # bool | optional | If true, private endpoint's access logs are sent to Cloud Lo…
  id                    = ""     # string | optional+computed
  reserved_ip_ranges    = []     # list(string) | optional | A list of reserved ip ranges under the VPC network that can …

  # create_time           = ""     # string | computed | The timestamp of when the Index was created in RFC3339 UTC "…
  # index_sync_time       = ""     # string | computed | The DeployedIndex may depend on various data on its original…
  # name                  = ""     # string | computed | The name of the DeployedIndex resource.
  # private_endpoints = [  # list(object)
  #   {
  #     match_grpc_address = ""
  #     psc_automated_endpoints = [  # list(object)
  #       {
  #         match_address = ""
  #         network = ""
  #         project_id = ""
  #       }
  #     ]
  #     service_attachment = ""
  #   }
  # ]

  automatic_resources { # list [0..1]
    max_replica_count = 0      # number | optional+computed | The maximum number of replicas this DeployedModel may be dep…
    min_replica_count = 0      # number | optional+computed | The minimum number of replicas this DeployedModel will be al…

  }

  dedicated_resources { # list [0..1]
    min_replica_count = 0      # number | required | The minimum number of machine replicas this DeployedModel wi…
    max_replica_count = 0      # number | optional+computed | The maximum number of replicas this DeployedModel may be dep…

    machine_spec { # list [1..1]
      machine_type = ""     # string | optional | The type of the machine.  See the [list of machine types sup…

    }

  }

  deployed_index_auth_config { # list [0..1]

    auth_provider { # list [0..1]
      allowed_issuers = []     # list(string) | optional | A list of allowed JWT issuers. Each entry must be a valid Go…
      audiences       = []     # list(string) | optional | The list of JWT audiences. that are allowed to access. A JWT…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


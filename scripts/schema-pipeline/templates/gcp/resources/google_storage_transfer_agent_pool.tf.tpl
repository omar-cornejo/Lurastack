# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_storage_transfer_agent_pool                  │
# └──────────────────────────────────────────────────────────────┘
resource "google_storage_transfer_agent_pool" "this" {

  name         = ""     # string | required | The ID of the agent pool to create.  The agentPoolId must me…
  display_name = ""     # string | optional | Specifies the client-specified AgentPool description.
  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed

  # state        = ""     # string | computed | Specifies the state of the AgentPool.

  bandwidth_limit { # list [0..1]
    limit_mbps = ""     # string | required | Bandwidth rate in megabytes per second, distributed across a…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dns_response_policy                          │
# └──────────────────────────────────────────────────────────────┘
resource "google_dns_response_policy" "this" {

  response_policy_name = ""     # string | required | The user assigned name for this Response Policy, such as 'my…
  description          = ""     # string | optional | The description of the response policy, such as 'My new resp…
  id                   = ""     # string | optional+computed
  project              = ""     # string | optional+computed

  gke_clusters { # list
    gke_cluster_name = ""     # string | required | The resource name of the cluster to bind this ManagedZone to…

  }

  networks { # list
    network_url = ""     # string | required | The fully qualified URL of the VPC network to bind to. This …

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


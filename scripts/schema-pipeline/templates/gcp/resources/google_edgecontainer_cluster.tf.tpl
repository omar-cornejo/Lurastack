# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_edgecontainer_cluster                        │
# └──────────────────────────────────────────────────────────────┘
resource "google_edgecontainer_cluster" "this" {

  location                                  = ""     # string | required | The location of the resource.
  name                                      = ""     # string | required | The GDCE cluster name.
  default_max_pods_per_node                 = 0      # number | optional+computed | The default maximum number of pods per node used if a maximu…
  external_load_balancer_ipv4_address_pools = []     # list(string) | optional+computed | Address pools for cluster data plane external load balancing…
  id                                        = ""     # string | optional+computed
  labels                                    = {}     # map(string) | optional | User-defined labels for the edgecloud cluster.  **Note**: Th…
  project                                   = ""     # string | optional+computed
  release_channel                           = ""     # string | optional+computed | The release channel a cluster is subscribed to. Possible val…
  target_version                            = ""     # string | optional+computed | The target cluster version. For example: "1.5.0".

  # cluster_ca_certificate                    = ""     # string | computed+sensitive | The PEM-encoded public certificate of the cluster's CA.
  # control_plane_version                     = ""     # string | computed | The control plane release version.
  # create_time                               = ""     # string | computed | The time the cluster was created, in RFC3339 text format.
  # effective_labels                          = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # endpoint                                  = ""     # string | computed | The IP address of the Kubernetes API server.
  # maintenance_events = [  # list(object)
  #   {
  #     create_time = ""
  #     end_time = ""
  #     operation = ""
  #     schedule = ""
  #     start_time = ""
  #     state = ""
  #     target_version = ""
  #     type = ""
  #     update_time = ""
  #     uuid = ""
  #   }
  # ]
  # node_version                              = ""     # string | computed | The lowest release version among all worker nodes. This fiel…
  # port                                      = 0      # number | computed | The port number of the Kubernetes API server.
  # status                                    = ""     # string | computed | Indicates the status of the cluster.
  # terraform_labels                          = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time                               = ""     # string | computed | The time the cluster was last updated, in RFC3339 text forma…

  authorization { # list [1..1]

    admin_users { # list [1..1]
      username = ""     # string | required | An active Google username.

    }

  }

  control_plane { # list [0..1]

    local { # list [0..1]
      machine_filter           = ""     # string | optional | Only machines matching this filter will be allowed to host c…
      node_count               = 0      # number | optional+computed | The number of nodes to serve as replicas of the Control Plan…
      node_location            = ""     # string | optional+computed | Name of the Google Distributed Cloud Edge zones where this n…
      shared_deployment_policy = ""     # string | optional+computed | Policy configuration about how user applications are deploye…

    }

    remote { # list [0..1]
      node_location = ""     # string | optional+computed | Name of the Google Distributed Cloud Edge zones where this n…

    }

  }

  control_plane_encryption { # list [0..1]
    kms_key                = ""     # string | optional+computed | The Cloud KMS CryptoKey e.g. projects/{project}/locations/{l…

    # kms_key_active_version = ""     # string | computed | The Cloud KMS CryptoKeyVersion currently in use for protecti…
    # kms_key_state          = ""     # string | computed | Availability of the Cloud KMS CryptoKey. If not 'KEY_AVAILAB…
    # kms_status = [  # list(object)
    #   {
    #     code = 0
    #     message = ""
    #   }
    # ]

  }

  fleet { # list [1..1]
    project    = ""     # string | required | The name of the Fleet host project where this cluster will b…

    # membership = ""     # string | computed | The name of the managed Hub Membership resource associated t…

  }

  maintenance_policy { # list [0..1]

    maintenance_exclusions { # list
      id = ""     # string | optional+computed | A unique (per cluster) id for the window.

      window { # list [0..1]
        end_time   = ""     # string | optional+computed | The time that the window ends. The end time must take place …
        start_time = ""     # string | optional+computed | The time that the window first starts.

      }

    }

    window { # list [1..1]

      recurring_window { # list [1..1]
        recurrence = ""     # string | optional+computed | An RRULE (https://tools.ietf.org/html/rfc5545#section-3.8.5.…

        window { # list [0..1]
          end_time   = ""     # string | optional+computed | The time that the window ends. The end time must take place …
          start_time = ""     # string | optional+computed | The time that the window first starts.

        }

      }

    }

  }

  networking { # list [1..1]
    cluster_ipv4_cidr_blocks  = []     # list(string) | required | All pods in the cluster are assigned an RFC1918 IPv4 address…
    services_ipv4_cidr_blocks = []     # list(string) | required | All services in the cluster are assigned an RFC1918 IPv4 add…
    cluster_ipv6_cidr_blocks  = []     # list(string) | optional | If specified, dual stack mode is enabled and all pods in the…
    services_ipv6_cidr_blocks = []     # list(string) | optional | If specified, dual stack mode is enabled and all services in…

    # network_type              = ""     # string | computed | IP addressing type of this cluster i.e. SINGLESTACK_V4 vs DU…

  }

  system_addons_config { # list [0..1]

    ingress { # list [0..1]
      disabled = false  # bool | optional+computed | Whether Ingress is disabled.
      ipv4_vip = ""     # string | optional+computed | Ingress VIP.

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


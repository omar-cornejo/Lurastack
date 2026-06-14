# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_gkeonprem_bare_metal_admin_cluster           │
# └──────────────────────────────────────────────────────────────┘
resource "google_gkeonprem_bare_metal_admin_cluster" "this" {

  location              = ""     # string | required | The location of the resource.
  name                  = ""     # string | required | The bare metal admin cluster name.
  annotations           = {}     # map(string) | optional | Annotations on the Bare Metal Admin Cluster. This field has …
  bare_metal_version    = ""     # string | optional | A human readable description of this Bare Metal Admin Cluste…
  description           = ""     # string | optional | A human readable description of this Bare Metal Admin Cluste…
  id                    = ""     # string | optional+computed
  project               = ""     # string | optional+computed

  # create_time           = ""     # string | computed | The time the cluster was created, in RFC3339 text format.
  # delete_time           = ""     # string | computed | The time the cluster was deleted, in RFC3339 text format.
  # effective_annotations = {}     # map(string) | computed | All of annotations (key/value pairs) present on the resource…
  # endpoint              = ""     # string | computed | The IP address name of Bare Metal Admin Cluster's API server…
  # etag                  = ""     # string | computed | This checksum is computed by the server based on the value o…
  # fleet = [  # list(object)
  #   {
  #     membership = ""
  #   }
  # ]
  # local_name            = ""     # string | computed | The object name of the Bare Metal Admin Cluster custom resou…
  # reconciling           = false  # bool | computed | If set, there are currently changes in flight to the Bare Me…
  # state                 = ""     # string | computed | The current state of this cluster.
  # status = [  # list(object)
  #   {
  #     conditions = [  # list(object)
  #       {
  #         last_transition_time = ""
  #         message = ""
  #         reason = ""
  #         state = ""
  #         type = ""
  #       }
  #     ]
  #     error_message = ""
  #   }
  # ]
  # uid                   = ""     # string | computed | The unique identifier of the Bare Metal Admin Cluster.
  # update_time           = ""     # string | computed | The time the cluster was last updated, in RFC3339 text forma…
  # validation_check = [  # list(object)
  #   {
  #     options = ""
  #     scenario = ""
  #     status = [  # list(object)
  #       {
  #         result = [  # list(object)
  #           {
  #             category = ""
  #             description = ""
  #             details = ""
  #             options = ""
  #             reason = ""
  #           }
  #         ]
  #       }
  #     ]
  #   }
  # ]

  cluster_operations { # list [0..1]
    enable_application_logs = false  # bool | optional | Whether collection of application logs/metrics should be ena…

  }

  control_plane { # list [0..1]

    api_server_args { # list
      argument = ""     # string | required | The argument name as it appears on the API Server command li…
      value    = ""     # string | required | The value of the arg as it will be passed to the API Server …

    }

    control_plane_node_pool_config { # list [1..1]

      node_pool_config { # list [1..1]
        labels           = {}     # map(string) | optional | The map of Kubernetes labels (key/value pairs) to be applied…
        operating_system = ""     # string | optional | Specifies the nodes operating system (default: LINUX).

        node_configs { # list
          labels  = {}     # map(string) | optional | The map of Kubernetes labels (key/value pairs) to be applied…
          node_ip = ""     # string | optional | The default IPv4 address for SSH access and Kubernetes node.…

        }

        taints { # list
          effect = ""     # string | optional | Specifies the nodes operating system (default: LINUX). Possi…
          key    = ""     # string | optional | Key associated with the effect.
          value  = ""     # string | optional | Value associated with the effect.

        }

      }

    }

  }

  load_balancer { # list [0..1]

    manual_lb_config { # list [0..1]
      enabled = false  # bool | required | Whether manual load balancing is enabled.

    }

    port_config { # list [1..1]
      control_plane_load_balancer_port = 0      # number | required | The port that control plane hosted load balancers will liste…

    }

    vip_config { # list [1..1]
      control_plane_vip = ""     # string | required | The VIP which you previously set aside for the Kubernetes AP…

    }

  }

  maintenance_config { # list [0..1]
    maintenance_address_cidr_blocks = []     # list(string) | required | All IPv4 address from these ranges will be placed into maint…

  }

  network_config { # list [0..1]

    island_mode_cidr { # list [0..1]
      pod_address_cidr_blocks     = []     # list(string) | required | All pods in the cluster are assigned an RFC1918 IPv4 address…
      service_address_cidr_blocks = []     # list(string) | required | All services in the cluster are assigned an RFC1918 IPv4 add…

    }

  }

  node_access_config { # list [0..1]
    login_user = ""     # string | optional | LoginUser is the user name used to access node machines. It …

  }

  node_config { # list [0..1]
    max_pods_per_node = 0      # number | optional | The maximum number of pods a node can run. The size of the C…

  }

  proxy { # list [0..1]
    uri      = ""     # string | required | Specifies the address of your proxy server. For Example: htt…
    no_proxy = []     # list(string) | optional | A list of IPs, hostnames, and domains that should skip the p…

  }

  security_config { # list [0..1]

    authorization { # list [0..1]

      admin_users { # list [1..*]
        username = ""     # string | required | The name of the user, e.g. 'my-gcp-id@gmail.com'.

      }

    }

  }

  storage { # list [0..1]

    lvp_node_mounts_config { # list [1..1]
      path          = ""     # string | required | The host machine path.
      storage_class = ""     # string | required | The StorageClass name that PVs will be created with.

    }

    lvp_share_config { # list [1..1]
      shared_path_pv_count = 0      # number | optional | The number of subdirectories to create under path.

      lvp_config { # list [1..1]
        path          = ""     # string | required | The host machine path.
        storage_class = ""     # string | required | The StorageClass name that PVs will be created with.

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


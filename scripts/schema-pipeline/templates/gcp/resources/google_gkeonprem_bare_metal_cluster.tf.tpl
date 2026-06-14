# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_gkeonprem_bare_metal_cluster                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_gkeonprem_bare_metal_cluster" "this" {

  admin_cluster_membership = ""     # string | required | The Admin Cluster this Bare Metal User Cluster belongs to. T…
  bare_metal_version       = ""     # string | required | A human readable description of this Bare Metal User Cluster…
  location                 = ""     # string | required | The location of the resource.
  name                     = ""     # string | required | The bare metal cluster name.
  annotations              = {}     # map(string) | optional | Annotations on the Bare Metal User Cluster. This field has t…
  description              = ""     # string | optional | A human readable description of this Bare Metal User Cluster…
  id                       = ""     # string | optional+computed
  project                  = ""     # string | optional+computed

  # create_time              = ""     # string | computed | The time the cluster was created, in RFC3339 text format.
  # delete_time              = ""     # string | computed | The time the cluster was deleted, in RFC3339 text format.
  # effective_annotations    = {}     # map(string) | computed | All of annotations (key/value pairs) present on the resource…
  # endpoint                 = ""     # string | computed | The IP address name of Bare Metal User Cluster's API server.
  # etag                     = ""     # string | computed | This checksum is computed by the server based on the value o…
  # fleet = [  # list(object)
  #   {
  #     membership = ""
  #   }
  # ]
  # local_name               = ""     # string | computed | The object name of the Bare Metal Cluster custom resource on…
  # reconciling              = false  # bool | computed | If set, there are currently changes in flight to the Bare Me…
  # state                    = ""     # string | computed | The current state of this cluster.
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
  # uid                      = ""     # string | computed | The unique identifier of the Bare Metal User Cluster.
  # update_time              = ""     # string | computed | The time the cluster was last updated, in RFC3339 text forma…
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

  binary_authorization { # list [0..1]
    evaluation_mode = ""     # string | optional | Mode of operation for binauthz policy evaluation. If unspeci…

  }

  cluster_operations { # list [0..1]
    enable_application_logs = false  # bool | optional | Whether collection of application logs/metrics should be ena…

  }

  control_plane { # list [1..1]

    api_server_args { # list
      argument = ""     # string | required | The argument name as it appears on the API Server command li…
      value    = ""     # string | required | The value of the arg as it will be passed to the API Server …

    }

    control_plane_node_pool_config { # list [1..1]

      node_pool_config { # list [1..1]
        labels           = {}     # map(string) | optional+computed | The map of Kubernetes labels (key/value pairs) to be applied…
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

  load_balancer { # list [1..1]

    bgp_lb_config { # list [0..1]
      asn = 0      # number | required | BGP autonomous system number (ASN) of the cluster. This fiel…

      address_pools { # list [1..*]
        addresses       = []     # list(string) | required | The addresses that are part of this pool. Each address must …
        pool            = ""     # string | required | The name of the address pool.
        avoid_buggy_ips = false  # bool | optional | If true, avoid using IPs ending in .0 or .255. This avoids b…
        manual_assign   = ""     # string | optional | If true, prevent IP addresses from being automatically assig…

      }

      bgp_peer_configs { # list [1..*]
        asn                 = 0      # number | required | BGP autonomous system number (ASN) for the network that cont…
        ip_address          = ""     # string | required | The IP address of the external peer device.
        control_plane_nodes = []     # list(string) | optional | The IP address of the control plane node that connects to th…

      }

      load_balancer_node_pool_config { # list [0..1]

        node_pool_config { # list [0..1]
          labels           = {}     # map(string) | optional | The map of Kubernetes labels (key/value pairs) to be applied…
          operating_system = ""     # string | optional | Specifies the nodes operating system (default: LINUX).

          kubelet_config { # list [0..1]
            registry_burst                 = 0      # number | optional | The maximum size of bursty pulls, temporarily allows pulls t…
            registry_pull_qps              = 0      # number | optional | The limit of registry pulls per second. Setting this value t…
            serialize_image_pulls_disabled = false  # bool | optional | Prevents the Kubelet from pulling multiple images at a time.…

          }

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

    manual_lb_config { # list [0..1]
      enabled = false  # bool | required | Whether manual load balancing is enabled.

    }

    metal_lb_config { # list [0..1]

      address_pools { # list [1..*]
        addresses       = []     # list(string) | required | The addresses that are part of this pool. Each address must …
        pool            = ""     # string | required | The name of the address pool.
        avoid_buggy_ips = false  # bool | optional | If true, avoid using IPs ending in .0 or .255. This avoids b…
        manual_assign   = false  # bool | optional | If true, prevent IP addresses from being automatically assig…

      }

      load_balancer_node_pool_config { # list [0..1]

        node_pool_config { # list [0..1]
          labels           = {}     # map(string) | optional+computed | The map of Kubernetes labels (key/value pairs) to be applied…
          operating_system = ""     # string | optional+computed | Specifies the nodes operating system (default: LINUX).

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

    port_config { # list [1..1]
      control_plane_load_balancer_port = 0      # number | required | The port that control plane hosted load balancers will liste…

    }

    vip_config { # list [1..1]
      control_plane_vip = ""     # string | required | The VIP which you previously set aside for the Kubernetes AP…
      ingress_vip       = ""     # string | required | The VIP which you previously set aside for ingress traffic i…

    }

  }

  maintenance_config { # list [0..1]
    maintenance_address_cidr_blocks = []     # list(string) | required | All IPv4 address from these ranges will be placed into maint…

  }

  network_config { # list [1..1]
    advanced_networking = false  # bool | optional | Enables the use of advanced Anthos networking features, such…

    island_mode_cidr { # list [0..1]
      pod_address_cidr_blocks     = []     # list(string) | required | All pods in the cluster are assigned an RFC1918 IPv4 address…
      service_address_cidr_blocks = []     # list(string) | required | All services in the cluster are assigned an RFC1918 IPv4 add…

    }

    multiple_network_interfaces_config { # list [0..1]
      enabled = false  # bool | optional | Whether to enable multiple network interfaces for your pods.…

    }

    sr_iov_config { # list [0..1]
      enabled = false  # bool | optional | Whether to install the SR-IOV operator.

    }

  }

  node_access_config { # list [0..1]
    login_user = ""     # string | optional+computed | LoginUser is the user name used to access node machines. It …

  }

  node_config { # list [0..1]
    container_runtime = ""     # string | optional+computed | The available runtimes that can be used to run containers in…
    max_pods_per_node = 0      # number | optional+computed | The maximum number of pods a node can run. The size of the C…

  }

  os_environment_config { # list [0..1]
    package_repo_excluded = false  # bool | required | Whether the package repo should not be included when initial…

  }

  proxy { # list [0..1]
    uri      = ""     # string | required | Specifies the address of your proxy server. For example: htt…
    no_proxy = []     # list(string) | optional | A list of IPs, hostnames, and domains that should skip the p…

  }

  security_config { # list [0..1]

    authorization { # list [0..1]

      admin_users { # list [1..*]
        username = ""     # string | required | The name of the user, e.g. 'my-gcp-id@gmail.com'.

      }

    }

  }

  storage { # list [1..1]

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

  upgrade_policy { # list [0..1]
    policy = ""     # string | optional | Specifies which upgrade policy to use. Possible values: ["SE…

  }

}


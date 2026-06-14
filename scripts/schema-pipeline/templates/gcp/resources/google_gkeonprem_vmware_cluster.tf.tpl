# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_gkeonprem_vmware_cluster                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_gkeonprem_vmware_cluster" "this" {

  admin_cluster_membership = ""     # string | required | The admin cluster this VMware User Cluster belongs to. This …
  location                 = ""     # string | required | The location of the resource.
  name                     = ""     # string | required | The VMware cluster name.
  on_prem_version          = ""     # string | required | The Anthos clusters on the VMware version for your user clus…
  annotations              = {}     # map(string) | optional | Annotations on the VMware User Cluster. This field has the s…
  description              = ""     # string | optional | A human readable description of this VMware User Cluster.
  disable_bundled_ingress  = false  # bool | optional | Disable bundled ingress.
  enable_control_plane_v2  = false  # bool | optional | Enable control plane V2. Default to false.
  id                       = ""     # string | optional+computed
  project                  = ""     # string | optional+computed
  vm_tracking_enabled      = false  # bool | optional+computed | Enable VM tracking.

  # create_time              = ""     # string | computed | The time at which VMware User Cluster was created.
  # delete_time              = ""     # string | computed | The time at which VMware User Cluster was deleted.
  # effective_annotations    = {}     # map(string) | computed | All of annotations (key/value pairs) present on the resource…
  # endpoint                 = ""     # string | computed | The DNS name of VMware User Cluster's API server.
  # etag                     = ""     # string | computed | This checksum is computed by the server based on the value o…
  # fleet = [  # list(object)
  #   {
  #     membership = ""
  #   }
  # ]
  # local_name               = ""     # string | computed | The object name of the VMware OnPremUserCluster custom resou…
  # reconciling              = false  # bool | computed | If set, there are currently changes in flight to the VMware …
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
  # uid                      = ""     # string | computed | The unique identifier of the VMware User Cluster.
  # update_time              = ""     # string | computed | The time at which VMware User Cluster was last updated.
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

  anti_affinity_groups { # list [0..1]
    aag_config_disabled = false  # bool | required | Spread nodes across at least three physical hosts (requires …

  }

  authorization { # list [0..1]

    admin_users { # list
      username = ""     # string | required | The name of the user, e.g. 'my-gcp-id@gmail.com'.

    }

  }

  auto_repair_config { # list [0..1]
    enabled = false  # bool | required | Whether auto repair is enabled.

  }

  control_plane_node { # list [1..1]
    cpus           = 0      # number | optional | The number of CPUs for each admin cluster node that serve as…
    memory         = 0      # number | optional | The megabytes of memory for each admin cluster node that ser…
    replicas       = 0      # number | optional | The number of control plane nodes for this VMware User Clust…

    # vsphere_config = [  # list(object)
    #   {
    #     datastore = ""
    #     storage_policy_name = ""
    #   }
    # ]

    auto_resize_config { # list [0..1]
      enabled = false  # bool | required | Whether to enable control plane node auto resizing.

    }

  }

  dataplane_v2 { # list [0..1]
    advanced_networking          = false  # bool | optional | Enable advanced networking which requires dataplane_v2_enabl…
    dataplane_v2_enabled         = false  # bool | optional | Enables Dataplane V2.
    windows_dataplane_v2_enabled = false  # bool | optional | Enable Dataplane V2 for clusters with Windows nodes.

  }

  load_balancer { # list [0..1]

    f5_config { # list [0..1]
      address   = ""     # string | optional | The load balancer's IP address.
      partition = ""     # string | optional | he preexisting partition to be used by the load balancer. T …
      snat_pool = ""     # string | optional+computed | The pool name. Only necessary, if using SNAT.

    }

    manual_lb_config { # list [0..1]
      control_plane_node_port       = 0      # number | optional+computed | NodePort for control plane service. The Kubernetes API serve…
      ingress_http_node_port        = 0      # number | optional+computed | NodePort for ingress service's http. The ingress service in …
      ingress_https_node_port       = 0      # number | optional+computed | NodePort for ingress service's https. The ingress service in…
      konnectivity_server_node_port = 0      # number | optional+computed | NodePort for konnectivity server service running as a sideca…

    }

    metal_lb_config { # list [0..1]

      address_pools { # list [1..*]
        addresses       = []     # list(string) | required | The addresses that are part of this pool. Each address must …
        pool            = ""     # string | required | The name of the address pool.
        avoid_buggy_ips = false  # bool | optional+computed | If true, avoid using IPs ending in .0 or .255. This avoids b…
        manual_assign   = false  # bool | optional+computed | If true, prevent IP addresses from being automatically assig…

      }

    }

    vip_config { # list [0..1]
      control_plane_vip = ""     # string | optional | The VIP which you previously set aside for the Kubernetes AP…
      ingress_vip       = ""     # string | optional | The VIP which you previously set aside for ingress traffic i…

    }

  }

  network_config { # list [0..1]
    pod_address_cidr_blocks     = []     # list(string) | required | All pods in the cluster are assigned an RFC1918 IPv4 address…
    service_address_cidr_blocks = []     # list(string) | required | All services in the cluster are assigned an RFC1918 IPv4 add…
    vcenter_network             = ""     # string | optional+computed | vcenter_network specifies vCenter network name. Inherited fr…

    control_plane_v2_config { # list [0..1]

      control_plane_ip_block { # list [0..1]
        gateway = ""     # string | optional | The network gateway used by the VMware User Cluster.
        netmask = ""     # string | optional | The netmask used by the VMware User Cluster.

        ips { # list
          hostname = ""     # string | optional+computed | Hostname of the machine. VM's name will be used if this fiel…
          ip       = ""     # string | optional | IP could be an IP address (like 1.2.3.4) or a CIDR (like 1.2…

        }

      }

    }

    dhcp_ip_config { # list [0..1]
      enabled = false  # bool | required | enabled is a flag to mark if DHCP IP allocation is used for …

    }

    host_config { # list [0..1]
      dns_search_domains = []     # list(string) | optional | DNS search domains.
      dns_servers        = []     # list(string) | optional | DNS servers.
      ntp_servers        = []     # list(string) | optional | NTP servers.

    }

    static_ip_config { # list [0..1]

      ip_blocks { # list [1..*]
        gateway = ""     # string | required | The network gateway used by the VMware User Cluster.
        netmask = ""     # string | required | The netmask used by the VMware User Cluster.

        ips { # list [1..*]
          ip       = ""     # string | required | IP could be an IP address (like 1.2.3.4) or a CIDR (like 1.2…
          hostname = ""     # string | optional+computed | Hostname of the machine. VM's name will be used if this fiel…

        }

      }

    }

  }

  storage { # list [0..1]
    vsphere_csi_disabled = false  # bool | required | Whether or not to deploy vSphere CSI components in the VMwar…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  upgrade_policy { # list [0..1]
    control_plane_only = false  # bool | optional | Controls whether the upgrade applies to the control plane on…

  }

  vcenter { # list [0..1]
    ca_cert_data        = ""     # string | optional | Contains the vCenter CA certificate public key for SSL verif…
    cluster             = ""     # string | optional | The name of the vCenter cluster for the user cluster.
    datacenter          = ""     # string | optional | The name of the vCenter datacenter for the user cluster.
    datastore           = ""     # string | optional | The name of the vCenter datastore for the user cluster.
    folder              = ""     # string | optional | The name of the vCenter folder for the user cluster.
    resource_pool       = ""     # string | optional | The name of the vCenter resource pool for the user cluster.
    storage_policy_name = ""     # string | optional | The name of the vCenter storage policy for the user cluster.

    # address             = ""     # string | computed | The vCenter IP address.

  }

}


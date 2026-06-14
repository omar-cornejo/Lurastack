# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_vmwareengine_private_cloud                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_vmwareengine_private_cloud" "this" {

  location                          = ""     # string | required | The location where the PrivateCloud should reside.
  name                              = ""     # string | required | The ID of the PrivateCloud.
  deletion_delay_hours              = 0      # number | optional | The number of hours to delay this request. You can set this …
  description                       = ""     # string | optional | User-provided description for this private cloud.
  id                                = ""     # string | optional+computed
  project                           = ""     # string | optional+computed
  send_deletion_delay_hours_if_zero = false  # bool | optional | While set true, deletion_delay_hours value will be sent in t…
  type                              = ""     # string | optional | Initial type of the private cloud. Possible values: ["STANDA…

  # hcx = [  # list(object)
  #   {
  #     fqdn = ""
  #     internal_ip = ""
  #     state = ""
  #     version = ""
  #   }
  # ]
  # nsx = [  # list(object)
  #   {
  #     fqdn = ""
  #     internal_ip = ""
  #     state = ""
  #     version = ""
  #   }
  # ]
  # state                             = ""     # string | computed | State of the resource. New values may be added to this enum …
  # uid                               = ""     # string | computed | System-generated unique identifier for the resource.
  # vcenter = [  # list(object)
  #   {
  #     fqdn = ""
  #     internal_ip = ""
  #     state = ""
  #     version = ""
  #   }
  # ]

  management_cluster { # list [1..1]
    cluster_id = ""     # string | required | The user-provided identifier of the new Cluster. The identif…

    node_type_configs { # set
      node_count        = 0      # number | required | The number of nodes of this type in the cluster.
      node_type_id      = ""     # string | required
      custom_core_count = 0      # number | optional | Customized number of cores available to each node of the typ…

    }

    stretched_cluster_config { # list [0..1]
      preferred_location = ""     # string | optional | Zone that will remain operational when connection between th…
      secondary_location = ""     # string | optional | Additional zone for a higher level of availability and load …

    }

  }

  network_config { # list [1..1]
    management_cidr                      = ""     # string | required | Management CIDR used by VMware management appliances.
    vmware_engine_network                = ""     # string | optional | The relative resource name of the VMware Engine network atta…

    # dns_server_ip                        = ""     # string | computed | DNS Server IP of the Private Cloud.
    # management_ip_address_layout_version = 0      # number | computed | The IP address layout version of the management IP address r…
    # vmware_engine_network_canonical      = ""     # string | computed | The canonical name of the VMware Engine network in the form:…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}


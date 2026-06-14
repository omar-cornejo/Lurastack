# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_vmwareengine_private_cloud                       │
# └──────────────────────────────────────────────────────────────┘
data "google_vmwareengine_private_cloud" "this" {

  location                          = ""     # string | required | The location where the PrivateCloud should reside.
  name                              = ""     # string | required | The ID of the PrivateCloud.
  id                                = ""     # string | optional+computed
  project                           = ""     # string | optional

  # deletion_delay_hours              = 0      # number | computed | The number of hours to delay this request. You can set this …
  # description                       = ""     # string | computed | User-provided description for this private cloud.
  # hcx = [  # list(object)
  #   {
  #     fqdn = ""
  #     internal_ip = ""
  #     state = ""
  #     version = ""
  #   }
  # ]
  # management_cluster = [  # list(object)
  #   {
  #     cluster_id = ""
  #     node_type_configs = [  # set(object)
  #       {
  #         custom_core_count = 0
  #         node_count = 0
  #         node_type_id = ""
  #       }
  #     ]
  #     stretched_cluster_config = [  # list(object)
  #       {
  #         preferred_location = ""
  #         secondary_location = ""
  #       }
  #     ]
  #   }
  # ]
  # network_config = [  # list(object)
  #   {
  #     dns_server_ip = ""
  #     management_cidr = ""
  #     management_ip_address_layout_version = 0
  #     vmware_engine_network = ""
  #     vmware_engine_network_canonical = ""
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
  # send_deletion_delay_hours_if_zero = false  # bool | computed | While set true, deletion_delay_hours value will be sent in t…
  # state                             = ""     # string | computed | State of the resource. New values may be added to this enum …
  # type                              = ""     # string | computed | Initial type of the private cloud. Possible values: ["STANDA…
  # uid                               = ""     # string | computed | System-generated unique identifier for the resource.
  # vcenter = [  # list(object)
  #   {
  #     fqdn = ""
  #     internal_ip = ""
  #     state = ""
  #     version = ""
  #   }
  # ]

}


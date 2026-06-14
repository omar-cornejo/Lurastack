# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_vmwareengine_network_policy                      │
# └──────────────────────────────────────────────────────────────┘
data "google_vmwareengine_network_policy" "this" {

  location                        = ""     # string | required | The resource name of the location (region) to create the new…
  name                            = ""     # string | required | The ID of the Network Policy.
  id                              = ""     # string | optional+computed
  project                         = ""     # string | optional

  # create_time                     = ""     # string | computed | Creation time of this resource. A timestamp in RFC3339 UTC "…
  # description                     = ""     # string | computed | User-provided description for this network policy.
  # edge_services_cidr              = ""     # string | computed | IP address range in CIDR notation used to create internet ac…
  # external_ip = [  # list(object)
  #   {
  #     enabled = false
  #     state = ""
  #   }
  # ]
  # internet_access = [  # list(object)
  #   {
  #     enabled = false
  #     state = ""
  #   }
  # ]
  # uid                             = ""     # string | computed | System-generated unique identifier for the resource.
  # update_time                     = ""     # string | computed | Last updated time of this resource. A timestamp in RFC3339 U…
  # vmware_engine_network           = ""     # string | computed | The relative resource name of the VMware Engine network. Spe…
  # vmware_engine_network_canonical = ""     # string | computed | The canonical name of the VMware Engine network in the form:…

}


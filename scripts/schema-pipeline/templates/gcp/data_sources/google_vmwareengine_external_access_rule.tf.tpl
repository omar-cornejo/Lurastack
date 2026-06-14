# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_vmwareengine_external_access_rule                │
# └──────────────────────────────────────────────────────────────┘
data "google_vmwareengine_external_access_rule" "this" {

  name                  = ""     # string | required | The ID of the external access rule.
  parent                = ""     # string | required | The resource name of the network policy. Resource names are …
  id                    = ""     # string | optional+computed

  # action                = ""     # string | computed | The action that the external access rule performs. Possible …
  # create_time           = ""     # string | computed | Creation time of this resource. A timestamp in RFC3339 UTC "…
  # description           = ""     # string | computed | User-provided description for the external access rule.
  # destination_ip_ranges = [  # list(object)
  #   {
  #     external_address = ""
  #     ip_address_range = ""
  #   }
  # ]
  # destination_ports     = []     # list(string) | computed | A list of destination ports to which the external access rul…
  # ip_protocol           = ""     # string | computed | The IP protocol to which the external access rule applies.
  # priority              = 0      # number | computed | External access rule priority, which determines the external…
  # source_ip_ranges = [  # list(object)
  #   {
  #     ip_address = ""
  #     ip_address_range = ""
  #   }
  # ]
  # source_ports          = []     # list(string) | computed | A list of source ports to which the external access rule app…
  # state                 = ""     # string | computed | State of the Cluster.
  # uid                   = ""     # string | computed | System-generated unique identifier for the resource.
  # update_time           = ""     # string | computed | Last updated time of this resource. A timestamp in RFC3339 U…

}


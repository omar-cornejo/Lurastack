# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_vmwareengine_subnet                              │
# └──────────────────────────────────────────────────────────────┘
data "google_vmwareengine_subnet" "this" {

  name                = ""     # string | required | The ID of the subnet. For userDefined subnets, this name sho…
  parent              = ""     # string | required | The resource name of the private cloud to create a new subne…
  id                  = ""     # string | optional+computed

  # create_time         = ""     # string | computed | Creation time of this resource. A timestamp in RFC3339 UTC "…
  # dhcp_address_ranges = [  # list(object)
  #   {
  #     first_address = ""
  #     last_address = ""
  #   }
  # ]
  # gateway_id          = ""     # string | computed | The canonical identifier of the logical router that this sub…
  # gateway_ip          = ""     # string | computed | The IP address of the gateway of this subnet. Must fall with…
  # ip_cidr_range       = ""     # string | computed | The IP address range of the subnet in CIDR format.
  # standard_config     = false  # bool | computed | Whether the NSX-T configuration in the backend follows the s…
  # state               = ""     # string | computed | State of the subnet.
  # type                = ""     # string | computed | The type of the subnet.
  # uid                 = ""     # string | computed | System-generated unique identifier for the resource.
  # update_time         = ""     # string | computed | Last updated time of this resource. A timestamp in RFC3339 U…
  # vlan_id             = 0      # number | computed | VLAN ID of the VLAN on which the subnet is configured.

}


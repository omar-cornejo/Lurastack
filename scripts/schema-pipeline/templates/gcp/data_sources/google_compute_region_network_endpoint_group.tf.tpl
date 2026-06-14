# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_region_network_endpoint_group            │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_region_network_endpoint_group" "this" {

  id                    = ""     # string | optional+computed
  name                  = ""     # string | optional | Name of the resource; provided by the client when the resour…
  project               = ""     # string | optional
  region                = ""     # string | optional | A reference to the region where the regional NEGs reside.
  self_link             = ""     # string | optional

  # app_engine = [  # list(object)
  #   {
  #     service = ""
  #     url_mask = ""
  #     version = ""
  #   }
  # ]
  # cloud_function = [  # list(object)
  #   {
  #     function = ""
  #     url_mask = ""
  #   }
  # ]
  # cloud_run = [  # list(object)
  #   {
  #     service = ""
  #     tag = ""
  #     url_mask = ""
  #   }
  # ]
  # description           = ""     # string | computed | An optional description of this resource. Provide this prope…
  # network               = ""     # string | computed | This field is only used for PSC and INTERNET NEGs.  The URL …
  # network_endpoint_type = ""     # string | computed | Type of network endpoints in this network endpoint group. De…
  # psc_target_service    = ""     # string | computed | This field is only used for PSC and INTERNET NEGs.  The targ…
  # subnetwork            = ""     # string | computed | This field is only used for PSC NEGs.  Optional URL of the s…

}


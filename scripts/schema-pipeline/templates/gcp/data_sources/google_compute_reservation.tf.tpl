# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_reservation                              │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_reservation" "this" {

  name                          = ""     # string | required | Name of the resource. Provided by the client when the resour…
  zone                          = ""     # string | required | The zone where the reservation is made.
  id                            = ""     # string | optional+computed
  project                       = ""     # string | optional

  # commitment                    = ""     # string | computed | Full or partial URL to a parent commitment. This field displ…
  # creation_timestamp            = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # description                   = ""     # string | computed | An optional description of this resource.
  # self_link                     = ""     # string | computed
  # share_settings = [  # list(object)
  #   {
  #     project_map = [  # set(object)
  #       {
  #         id = ""
  #         project_id = ""
  #       }
  #     ]
  #     share_type = ""
  #   }
  # ]
  # specific_reservation = [  # list(object)
  #   {
  #     count = 0
  #     in_use_count = 0
  #     instance_properties = [  # list(object)
  #       {
  #         guest_accelerators = [  # list(object)
  #           {
  #             accelerator_count = 0
  #             accelerator_type = ""
  #           }
  #         ]
  #         local_ssds = [  # list(object)
  #           {
  #             disk_size_gb = 0
  #             interface = ""
  #           }
  #         ]
  #         machine_type = ""
  #         min_cpu_platform = ""
  #       }
  #     ]
  #   }
  # ]
  # specific_reservation_required = false  # bool | computed | When set to true, only VMs that target this reservation by n…
  # status                        = ""     # string | computed | The status of the reservation.

}


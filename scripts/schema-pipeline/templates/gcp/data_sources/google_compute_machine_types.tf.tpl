# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_machine_types                            │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_machine_types" "this" {

  filter        = ""     # string | optional
  id            = ""     # string | optional+computed
  project       = ""     # string | optional+computed | Project ID for this request.
  zone          = ""     # string | optional+computed | The name of the zone for this request.

  # machine_types = [  # list(object)
  #   {
  #     accelerators = [  # list(object)
  #       {
  #         guest_accelerator_count = 0
  #         guest_accelerator_type = ""
  #       }
  #     ]
  #     deprecated = [  # set(object)
  #       {
  #         replacement = ""
  #         state = ""
  #       }
  #     ]
  #     description = ""
  #     guest_cpus = 0
  #     is_shared_cpus = false
  #     maximum_persistent_disks = 0
  #     maximum_persistent_disks_size_gb = 0
  #     memory_mb = 0
  #     name = ""
  #     self_link = ""
  #   }
  # ]

}


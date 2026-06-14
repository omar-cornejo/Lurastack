# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_resource_policy                          │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_resource_policy" "this" {

  name                          = ""     # string | required | The name of the resource, provided by the client when initia…
  id                            = ""     # string | optional+computed
  project                       = ""     # string | optional
  region                        = ""     # string | optional | Region where resource policy resides.

  # description                   = ""     # string | computed | An optional description of this resource. Provide this prope…
  # disk_consistency_group_policy = [  # list(object)
  #   {
  #     enabled = false
  #   }
  # ]
  # group_placement_policy = [  # list(object)
  #   {
  #     availability_domain_count = 0
  #     collocation = ""
  #     vm_count = 0
  #   }
  # ]
  # instance_schedule_policy = [  # list(object)
  #   {
  #     expiration_time = ""
  #     start_time = ""
  #     time_zone = ""
  #     vm_start_schedule = [  # list(object)
  #       {
  #         schedule = ""
  #       }
  #     ]
  #     vm_stop_schedule = [  # list(object)
  #       {
  #         schedule = ""
  #       }
  #     ]
  #   }
  # ]
  # self_link                     = ""     # string | computed
  # snapshot_schedule_policy = [  # list(object)
  #   {
  #     retention_policy = [  # list(object)
  #       {
  #         max_retention_days = 0
  #         on_source_disk_delete = ""
  #       }
  #     ]
  #     schedule = [  # list(object)
  #       {
  #         daily_schedule = [  # list(object)
  #           {
  #             days_in_cycle = 0
  #             start_time = ""
  #           }
  #         ]
  #         hourly_schedule = [  # list(object)
  #           {
  #             hours_in_cycle = 0
  #             start_time = ""
  #           }
  #         ]
  #         weekly_schedule = [  # list(object)
  #           {
  #             day_of_weeks = [  # set(object)
  #               {
  #                 day = ""
  #                 start_time = ""
  #               }
  #             ]
  #           }
  #         ]
  #       }
  #     ]
  #     snapshot_properties = [  # list(object)
  #       {
  #         chain_name = ""
  #         guest_flush = false
  #         labels = {}  # map(string)
  #         storage_locations = []  # set(string)
  #       }
  #     ]
  #   }
  # ]

}


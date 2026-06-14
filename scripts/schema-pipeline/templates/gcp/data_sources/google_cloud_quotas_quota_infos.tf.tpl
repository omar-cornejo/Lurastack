# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_cloud_quotas_quota_infos                         │
# └──────────────────────────────────────────────────────────────┘
data "google_cloud_quotas_quota_infos" "this" {

  parent      = ""     # string | required
  service     = ""     # string | required
  id          = ""     # string | optional+computed

  # quota_infos = [  # list(object)
  #   {
  #     container_type = ""
  #     dimensions = []  # list(string)
  #     dimensions_infos = [  # list(object)
  #       {
  #         applicable_locations = []  # list(string)
  #         details = [  # list(object)
  #           {
  #             value = ""
  #           }
  #         ]
  #         dimensions = {}  # map(string)
  #       }
  #     ]
  #     is_concurrent = false
  #     is_fixed = false
  #     is_precise = false
  #     metric = ""
  #     metric_display_name = ""
  #     metric_unit = ""
  #     name = ""
  #     quota_display_name = ""
  #     quota_id = ""
  #     quota_increase_eligibility = [  # list(object)
  #       {
  #         ineligibility_reason = ""
  #         is_eligible = false
  #       }
  #     ]
  #     refresh_interval = ""
  #     service = ""
  #     service_request_quota_uri = ""
  #   }
  # ]

}


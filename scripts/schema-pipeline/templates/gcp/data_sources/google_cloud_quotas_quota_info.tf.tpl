# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_cloud_quotas_quota_info                          │
# └──────────────────────────────────────────────────────────────┘
data "google_cloud_quotas_quota_info" "this" {

  parent                     = ""     # string | required
  quota_id                   = ""     # string | required
  service                    = ""     # string | required
  id                         = ""     # string | optional+computed

  # container_type             = ""     # string | computed
  # dimensions                 = []     # list(string) | computed
  # dimensions_infos = [  # list(object)
  #   {
  #     applicable_locations = []  # list(string)
  #     details = [  # list(object)
  #       {
  #         value = ""
  #       }
  #     ]
  #     dimensions = {}  # map(string)
  #   }
  # ]
  # is_concurrent              = false  # bool | computed
  # is_fixed                   = false  # bool | computed
  # is_precise                 = false  # bool | computed
  # metric                     = ""     # string | computed
  # metric_display_name        = ""     # string | computed
  # metric_unit                = ""     # string | computed
  # name                       = ""     # string | computed
  # quota_display_name         = ""     # string | computed
  # quota_increase_eligibility = [  # list(object)
  #   {
  #     ineligibility_reason = ""
  #     is_eligible = false
  #   }
  # ]
  # refresh_interval           = ""     # string | computed
  # service_request_quota_uri  = ""     # string | computed

}


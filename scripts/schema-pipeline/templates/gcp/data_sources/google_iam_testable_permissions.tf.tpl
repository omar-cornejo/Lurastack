# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_iam_testable_permissions                         │
# └──────────────────────────────────────────────────────────────┘
data "google_iam_testable_permissions" "this" {

  full_resource_name   = ""     # string | required
  custom_support_level = ""     # string | optional
  id                   = ""     # string | optional+computed
  stages               = []     # list(string) | optional

  # permissions = [  # list(object)
  #   {
  #     api_disabled = false
  #     custom_support_level = ""
  #     name = ""
  #     stage = ""
  #     title = ""
  #   }
  # ]

}


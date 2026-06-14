# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_projects                                         │
# └──────────────────────────────────────────────────────────────┘
data "google_projects" "this" {

  filter   = ""     # string | required
  id       = ""     # string | optional+computed

  # projects = [  # list(object)
  #   {
  #     create_time = ""
  #     labels = {}  # map(string)
  #     lifecycle_state = ""
  #     name = ""
  #     number = ""
  #     parent = {}  # map(string)
  #     project_id = ""
  #   }
  # ]

}


# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_workspaces_bundle                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_workspaces_bundle" "this" {

  bundle_id    = ""     # string | optional
  id           = ""     # string | optional+computed
  name         = ""     # string | optional
  owner        = ""     # string | optional

  # compute_type = [  # list(object)
  #   {
  #     name = ""
  #   }
  # ]
  # description  = ""     # string | computed
  # root_storage = [  # list(object)
  #   {
  #     capacity = ""
  #   }
  # ]
  # user_storage = [  # list(object)
  #   {
  #     capacity = ""
  #   }
  # ]

}


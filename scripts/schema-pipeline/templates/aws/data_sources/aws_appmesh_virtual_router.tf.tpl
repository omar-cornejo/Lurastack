# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_appmesh_virtual_router                              │
# └──────────────────────────────────────────────────────────────┘
data "aws_appmesh_virtual_router" "this" {

  mesh_name         = ""     # string | required
  name              = ""     # string | required
  id                = ""     # string | optional+computed
  mesh_owner        = ""     # string | optional+computed
  tags              = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # created_date      = ""     # string | computed
  # last_updated_date = ""     # string | computed
  # resource_owner    = ""     # string | computed
  # spec = [  # list(object)
  #   {
  #     listener = [  # list(object)
  #       {
  #         port_mapping = [  # list(object)
  #           {
  #             port = 0
  #             protocol = ""
  #           }
  #         ]
  #       }
  #     ]
  #   }
  # ]

}

